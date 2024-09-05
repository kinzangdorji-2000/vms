# Generated by Django 4.0.3 on 2023-12-01 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vmsApp', '0005_alter_visitors_date_checkout'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='departments',
            options={'verbose_name_plural': 'List of Category'},
        ),
        migrations.AlterField(
            model_name='visitors',
            name='date_added',
            field=models.DateTimeField(),
        ),
        migrations.AlterField(
            model_name='visitors',
            name='date_checkout',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
