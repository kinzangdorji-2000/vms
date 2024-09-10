from django.db import models
from email.policy import default
from django.db import models
from django.utils import timezone
from django.db.models.signals import post_save
from django.dispatch import receiver
import qrcode
from PIL import Image
from django.contrib.auth.models import User
from django.contrib.auth.base_user import BaseUserManager
from datetime import datetime



# Create your models here.
class Departments(models.Model):
    name = models.CharField(max_length=250)
    status = models.CharField(max_length=2, choices=(('1','Active'), ('2','Inactive')), default = 1)
    delete_flag = models.IntegerField(default = 0)
    date_added = models.DateTimeField(default = timezone.now)
    date_created = models.DateTimeField(auto_now = True)

    class Meta:
        verbose_name_plural = "List of Category"        

    def __str__(self):
        return str(f"{self.name}")

class Visitors(models.Model):
    department = models.ForeignKey(Departments, on_delete = models.CASCADE, related_name='department',verbose_name='Category')
    name = models.CharField(max_length=250)
    gender = models.CharField(max_length=20, choices=(('Male','Male'), ('Female','Female')), default = 'Male')
    contact = models.CharField(max_length=250, null=True, blank = True)
    email = models.CharField(max_length=250, null=True, blank = True)
    address = models.TextField()
    reason = models.TextField()
    status = models.CharField(max_length=20, choices=(('checkin','checkin'), ('checkout','checkout')), default = 'checkin')
    date_added = models.DateTimeField(default=timezone.now)
    date_created = models.DateTimeField(auto_now = True,verbose_name='checkin date')
    date_checkout = models.DateTimeField(auto_now_add=True,verbose_name='checkout date')

    class Meta:
        verbose_name_plural = "List of Visit Logs"

    def __str__(self):
        return str(f"{self.name}")  

def save_visitor(request):
    form = VisitorForm(request.POST)
    if form.is_valid():
        visitor = form.save(commit=False)
        visitor.date_added = timezone.now()  # Ensure date_added is set
        visitor.save()
        # Redirect or return response
