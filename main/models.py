from django.db import models

class ConfigurationSettings(models.Model):
    configuration_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    details = models.JSONField(null=False)
    
    def __str__(self):
        return self.configuration_id
class NetworkComponent(models.Model):
    component_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    type = models.CharField(max_length=25, null=False)
    date_added = models.IntegerField(null=False)
    manufacturer = models.CharField(max_length=50, null=False)
    affects_uptime = models.BooleanField(null=False)
    location = models.CharField(max_length=50, null=False)
    status = models.BooleanField(null=False)
    configuration_id = models.ForeignKey(
        ConfigurationSettings,
        on_delete=models.PROTECT,
        blank=True
    )

    def __str__(self):
        return self.component_id

class Technician(models.Model):
    technician_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    name = models.CharField(max_length=100, null=False)
    username = models.CharField(max_length=45, null=False)
    email = models.CharField(max_length=50, null=False)
    password = models.CharField(max_length=100, null=False)
    contact_info = models.JSONField(null=False)
    skillset = models.JSONField(null=False)
    availability = models.BooleanField(null=False)

    def __str__(self):
        return self.technician_id

class User(models.Model):
    user_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    name = models.CharField(max_length=100, null=False)
    username = models.CharField(max_length=45, null=False)
    role = models.CharField(max_length=20, null=False)
    contact_info = models.JSONField(null=False)
    email = models.CharField(max_length=50, null=False)
    password = models.CharField(max_length=100, null=False)
    location = models.CharField(max_length=50, null=False)
    permissions = models.JSONField(null=False)

    def __str__(self):
        return self.user_id
class Fault(models.Model):
    fault_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    date_reported = models.IntegerField(null=False)
    description = models.TextField(max_length=500, null=True)
    status = models.CharField(max_length=20, null=False)
    priority_level = models.CharField(max_length=10, null=False)
    resolution_start_time = models.IntegerField(null=True)
    resolution_end_time = models.IntegerField(null=True)
    assigned_technician_id = models.ForeignKey(
        Technician,
        on_delete=models.PROTECT,
        blank=False
    )
    affected_component_id = models.ForeignKey(
        NetworkComponent,
        on_delete=models.PROTECT,
        blank=False
    )
    reported_user_id = models.ForeignKey(
        User,
        on_delete=models.PROTECT,
        blank=True,
        null=True,
    )

    def __str__(self):
        return self.fault_id

class Notification(models.Model):
    notification_id = models.CharField(max_length=25, null=False, unique=True, primary_key=True)
    message = models.TextField(max_length=50, null=False)
    type = models.CharField(max_length=25, null=False)
    status = models.BooleanField(null=False)
    created_at = models.IntegerField(null=False)
    user_id = models.ForeignKey(
        User,
        on_delete=models.PROTECT,
        blank=True,
        null=True,
    )
    fault_id = models.ForeignKey(
        Fault,
        on_delete=models.PROTECT,
        blank=False
    )

    def __str__(self):
        return self.notification_id

class Counters(models.Model):
    Pid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=55, null=False)
    value = models.IntegerField(null=False)
    last_updated = models.IntegerField(null=True)
    
    def __str__(self):
        return self.Pid

