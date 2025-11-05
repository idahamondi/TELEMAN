from django.contrib import admin
from . import models

# Register your models here.

@admin.register(models.User)
class UserAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Technician)
class TechnicianAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Fault)
class UserAdmin(admin.ModelAdmin):
    pass

@admin.register(models.NetworkComponent)
class UserAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Notification)
class UserAdmin(admin.ModelAdmin):
    pass

@admin.register(models.ConfigurationSettings)
class UserAdmin(admin.ModelAdmin):
    pass