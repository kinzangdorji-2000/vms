# from .myadmin import MyAdminSite
from django.contrib import admin
from vmsApp.models import Departments,Visitors
from admin_interface.models import Theme


class DepartmentsAdmin(admin.ModelAdmin):    
    list_display = ['name', 'status', 'date_created']

class VisitorsAdmin(admin.ModelAdmin):
    list_display = ['department','name','gender','contact','email','address', 'reason', 'status','date_created','date_checkout']        

admin.site.site_header = 'Visitor Management System'
admin.site.site_title = 'VMS Admin'
admin.site.index_title = 'VMS Admin Dashboard'

# Register your models here.
admin.site.register(Departments, DepartmentsAdmin)
admin.site.register(Visitors, VisitorsAdmin)
admin.site.unregister(Theme)



