from datetime import datetime
from django.shortcuts import redirect, render
import json
from django.contrib import messages
from django.contrib.auth.models import User
from django.http import HttpResponse
from vmsApp import models, forms
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from datetime import timedelta
from vmsApp.models import Visitors
import pandas as pd
from openpyxl import Workbook
from openpyxl.utils.dataframe import dataframe_to_rows
from openpyxl.styles import NamedStyle
from django.shortcuts import render

def context_data(request):
    fullpath = request.get_full_path()
    abs_uri = request.build_absolute_uri()
    abs_uri = abs_uri.split(fullpath)[0]
    context = {
        'system_host' : abs_uri,
        'page_name' : '',
        'page_title' : '',
        'system_name' : 'Visitor Management System',
        'topbar' : True,
        'footer' : True,
    }

    return context
    
def userregister(request):
    context = context_data(request)
    context['topbar'] = False
    context['footer'] = False
    context['page_title'] = "User Registration"
    if request.user.is_authenticated:
        return redirect("home-page")
    return render(request, 'register.html', context)

def save_register(request):
    resp={'status':'failed', 'msg':''}
    if not request.method == 'POST':
        resp['msg'] = "No data has been sent on this request"
    else:
        form = forms.SaveUser(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Your Account has been created succesfully")
            resp['status'] = 'success'
        else:
            for field in form:
                for error in field.errors:
                    if resp['msg'] != '':
                        resp['msg'] += str('<br />')
                    resp['msg'] += str(f"[{field.name}] {error}.")
            
    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def update_profile(request):
    context = context_data(request)
    context['page_title'] = 'Update Profile'
    user = User.objects.get(id = request.user.id)
    if not request.method == 'POST':
        form = forms.UpdateProfile(instance=user)
        context['form'] = form
        print(form)
    else:
        form = forms.UpdateProfile(request.POST, instance=user)
        if form.is_valid():
            form.save()
            messages.success(request, "Profile has been updated")
            return redirect("profile-page")
        else:
            context['form'] = form
            
    return render(request, 'manage_profile.html',context)

@login_required
def update_password(request):
    context =context_data(request)
    context['page_title'] = "Update Password"
    if request.method == 'POST':
        form = forms.UpdatePasswords(user = request.user, data= request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"Your Account Password has been updated successfully")
            update_session_auth_hash(request, form.user)
            return redirect("profile-page")
        else:
            context['form'] = form
    else:
        form = forms.UpdatePasswords(request.POST)
        context['form'] = form
    return render(request,'update_password.html',context)

# Create your views here.
def login_page(request):
    context = context_data(request)
    context['topbar'] = False
    context['footer'] = False
    context['page_name'] = 'login'
    context['page_title'] = 'Login'
    return render(request, 'login.html', context)

def login_user(request):
    logout(request)
    resp = {"status":'failed','msg':''}
    username = ''
    password = ''
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                resp['status']='success'
            else:
                resp['msg'] = "Incorrect username or password"
        else:
            resp['msg'] = "Incorrect username or password"
    return HttpResponse(json.dumps(resp),content_type='application/json')


@login_required
def home(request):
    context = context_data(request)
    
    current_datetime = timezone.now()
    start_of_day = timezone.make_aware(timezone.datetime.combine(current_datetime.date(), timezone.datetime.min.time()))
    end_of_day = timezone.make_aware(timezone.datetime.combine(current_datetime.date(), timezone.datetime.max.time()))

    context['page'] = 'home'
    context['page_title'] = 'Home'
    context['dapartments'] = models.Departments.objects.filter(delete_flag = 0, status = 1).all().count()
    context['users'] = User.objects.filter(is_superuser = False).count()   
    context['view_visit_log'] = models.Visitors.objects.filter(date_created__range=(start_of_day, end_of_day)).count() 
    context['current_view_visit_log'] = models.Visitors.objects.filter(status='checkin').all().count()
    date = datetime.now()
    year = date.strftime("%Y")
    month = date.strftime("%m")
    day = date.strftime("%d")
    context['visitors'] = models.Visitors.objects.filter(
                        date_added__year = year,
                        date_added__month = month,
                        date_added__day = day
    ).all().count()
    print(context)
    return render(request, 'home.html', context)

def logout_user(request):
    logout(request)
    return redirect('login-page')
    
@login_required
def profile(request):
    context = context_data(request)
    context['page'] = 'profile'
    context['page_title'] = "Profile"
    return render(request,'profile.html', context)


@login_required
def departments(request):
    context = context_data(request)
    context['page'] = 'departments'
    context['page_title'] = "Department List"
    context['departments'] = models.Departments.objects.filter(delete_flag = 0).all()
    return render(request, 'departments.html', context)

@login_required
def save_department(request):
    resp = { 'status': 'failed', 'msg' : '' }
    if request.method == 'POST':
        post = request.POST
        if not post['id'] == '':
            department = models.Departments.objects.get(id = post['id'])
            form = forms.SaveDepartment(request.POST, instance=department)
        else:
            form = forms.SaveDepartment(request.POST) 

        if form.is_valid():
            form.save()
            if post['id'] == '':
                messages.success(request, "Department has been saved successfully.")
            else:
                messages.success(request, "Department has been updated successfully.")
            resp['status'] = 'success'
        else:
            for field in form:
                for error in field.errors:
                    if not resp['msg'] == '':
                        resp['msg'] += str('<br/>')
                    resp['msg'] += str(f'[{field.name}] {error}')
    else:
         resp['msg'] = "There's no data sent on the request"

    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def manage_department(request, pk = None):
    context = context_data(request)
    context['page'] = 'manage_department'
    context['page_title'] = 'Manage Department'
    if pk is None:
        context['department'] = {}
    else:
        context['department'] = models.Departments.objects.get(id=pk)
    
    return render(request, 'manage_department.html', context)

@login_required
def delete_department(request, pk = None):
    resp = { 'status' : 'failed', 'msg':''}
    if pk is None:
        resp['msg'] = 'Department ID is invalid'
    else:
        try:
            models.Departments.objects.filter(pk = pk).update(delete_flag = 1)
            messages.success(request, "Department has been deleted successfully.")
            resp['status'] = 'success'
        except:
            resp['msg'] = "Deleting Department Failed"

    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def users(request):
    context = context_data(request)
    context['page'] = 'users'
    context['page_title'] = "User List"
    context['users'] = User.objects.exclude(pk=request.user.pk).filter(is_superuser = False).all()
    return render(request, 'users.html', context)

@login_required
def save_user(request):
    resp = { 'status': 'failed', 'msg' : '' }
    if request.method == 'POST':
        post = request.POST
        if not post['id'] == '':
            user = User.objects.get(id = post['id'])
            form = forms.UpdateUser(request.POST, instance=user)
        else:
            form = forms.SaveUser(request.POST) 

        if form.is_valid():
            form.save()
            if post['id'] == '':
                messages.success(request, "User has been saved successfully.")
            else:
                messages.success(request, "User has been updated successfully.")
            resp['status'] = 'success'
        else:
            for field in form:
                for error in field.errors:
                    if not resp['msg'] == '':
                        resp['msg'] += str('<br/>')
                    resp['msg'] += str(f'[{field.name}] {error}')
    else:
         resp['msg'] = "There's no data sent on the request"

    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def manage_user(request, pk = None):
    context = context_data(request)
    context['page'] = 'manage_user'
    context['page_title'] = 'Manage User'
    if pk is None:
        context['user'] = {}
    else:
        context['user'] = User.objects.get(id=pk)
    
    return render(request, 'manage_user.html', context)

@login_required
def delete_user(request, pk = None):
    resp = { 'status' : 'failed', 'msg':''}
    if pk is None:
        resp['msg'] = 'user ID is invalid'
    else:
        try:
            User.objects.filter(pk = pk).delete()
            messages.success(request, "user has been deleted successfully.")
            resp['status'] = 'success'
        except:
            resp['msg'] = "Deleting user Failed"

    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def visitors(request):
    context = context_data(request)
    context['page'] = 'visitors'
    context['page_title'] = "Visitor List"
    context['visitors'] = models.Visitors.objects.all().order_by('-id') 
    return render(request, 'visitors.html', context)

@login_required
def save_visitor(request):
    resp = { 'status': 'failed', 'msg' : '' }
    if request.method == 'POST':
        post = request.POST
        if not post['id'] == '':
            visitor = models.Visitors.objects.get(id = post['id'])
            form = forms.SaveVisitor(request.POST, instance=visitor)
        else:
            form = forms.SaveVisitor(request.POST) 

        if form.is_valid():
            form.save()
            if post['id'] == '':
                messages.success(request, "Visitor has been saved successfully.")
            else:
                messages.success(request, "Visitor has been updated successfully.")
            resp['status'] = 'success'
        else:
            for field in form:
                for error in field.errors:
                    if not resp['msg'] == '':
                        resp['msg'] += str('<br/>')
                    resp['msg'] += str(f'[{field.name}] {error}')
    else:
         resp['msg'] = "There's no data sent on the request"

    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def manage_visitor(request, pk = None):
    context = context_data(request)
    context['page'] = 'manage_visitor'
    context['page_title'] = 'Manage Visitor'
    if pk is None:
        context['visitor'] = {}
    else:
        context['visitor'] = models.Visitors.objects.get(id=pk)
    context['departments'] = models.Departments.objects.filter(status = 1, delete_flag = 0).all()
    
    return render(request, 'manage_visitor.html', context)
    
@login_required
def view_visitor(request, pk = None):
    context = context_data(request)
    context['page'] = 'manage_visitor'
    context['page_title'] = 'View Visitor Log'
    if pk is None:
        context['visitor'] = {}
    else:
        context['visitor'] = models.Visitors.objects.get(id=pk)
    context['departments'] = models.Departments.objects.filter(status = 1, delete_flag = 0).all()
    
    return render(request, 'view_visit_log.html', context)

@login_required
def delete_visitor(request, pk = None):
    resp = { 'status' : 'failed', 'msg':''}
    if pk is None:
        resp['msg'] = 'Visitor ID is invalid'
    else:
        try:
            models.Visitors.objects.filter(pk = pk).delete()
            messages.success(request, "Visitor has been deleted successfully.")
            resp['status'] = 'success'
        except:
            resp['msg'] = "Deleting Visitor Failed"

    return HttpResponse(json.dumps(resp), content_type="application/json")


@login_required
def report(request):
    context = context_data(request)
    context['page'] = 'visitors'
    context['page_title'] = "Daily Visitor Logs Report"

    # Parse the start and end dates from the GET parameters (assuming 'd/m/Y' format)
    filter_date_str = request.GET.get('filter_date', None)
    end_date_str = request.GET.get('end_date', None)

    if filter_date_str:
        # Parse dates using 'day/month/year' format
        filter_date = timezone.datetime.strptime(filter_date_str, "%d/%m/%Y").replace(
            hour=0, minute=0, second=0, microsecond=0
        )
    else:
        filter_date = timezone.now().replace(
            hour=0, minute=0, second=0, microsecond=0
        )

    if end_date_str:
        end_date = timezone.datetime.strptime(end_date_str, "%d/%m/%Y").replace(
            hour=23, minute=59, second=59, microsecond=999999
        )
    else:
        end_date = filter_date + timedelta(days=1)

    context['filter_date'] = filter_date
    context['end_date'] = end_date

    # Filter visitors between the start and end date
    context['visitors'] = Visitors.objects.filter(
        date_added__gte=filter_date,
        date_added__lte=end_date
    ).all()

    return render(request, 'report.html', context)

# CSV Report Generation
def generate_csv_report(request):
    # Query all visitors without filtering
    visitors = Visitors.objects.all()
    
    # Convert QuerySet to a list of dictionaries
    data = visitors.values('name', 'gender', 'contact', 'email', 'address', 'reason', 'status', 'date_created', 'date_checkout')
    
    # Convert the data to a DataFrame
    df = pd.DataFrame(list(data))

    # Create an HTTP response with CSV content
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="visitor_logs.csv"'
    
    # Write the DataFrame to CSV
    df.to_csv(path_or_buf=response, index=False)
    
    return response

# Excel Report Generation
def generate_excel_report(request):
    # Query all visitors without filtering
    visitors = Visitors.objects.all()
    
    # Convert QuerySet to a list of dictionaries
    data = visitors.values('name', 'gender', 'contact', 'email', 'address', 'reason', 'status', 'date_created', 'date_checkout')
    
    # Convert the data to a DataFrame
    df = pd.DataFrame(list(data))
    
    # Ensure datetimes are timezone-naive
    if 'date_created' in df.columns:
        df['date_created'] = df['date_created'].apply(lambda x: x.replace(tzinfo=None) if pd.notnull(x) else x)
    if 'date_checkout' in df.columns:
        df['date_checkout'] = df['date_checkout'].apply(lambda x: x.replace(tzinfo=None) if pd.notnull(x) else x)

    # Create an HTTP response with Excel content
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename="visitor_logs.xlsx"'
    
    # Create a workbook and add a worksheet
    wb = Workbook()
    ws = wb.active
    ws.title = "Visitor Logs"
    
    # Define a style for date columns
    date_style = NamedStyle(name='datetime', number_format='yyyy-mm-dd hh:mm:ss')
    
    # Write DataFrame to the worksheet
    for r_idx, row in enumerate(dataframe_to_rows(df, index=False, header=True), 1):
        for c_idx, value in enumerate(row, 1):
            cell = ws.cell(row=r_idx, column=c_idx, value=value)
            # Apply date formatting to date columns
            if df.columns[c_idx-1] in ['date_created', 'date_checkout']:
                cell.style = date_style

    # Auto-adjust column widths
    for col in ws.columns:
        max_length = 0
        column = col[0].column_letter
        for cell in col:
            try:
                if len(str(cell.value)) > max_length:
                    max_length = len(cell.value)
            except:
                pass
        adjusted_width = (max_length + 2)
        ws.column_dimensions[column].width = adjusted_width
    
    # Save the workbook to the HTTP response
    wb.save(response)

    return response

# Combined view to handle both CSV and Excel downloads
def download_report(request, format):
    if format == 'csv':
        return generate_csv_report(request)
    elif format == 'excel':
        return generate_excel_report(request)
    else:
        return HttpResponse('Invalid format', status=400)