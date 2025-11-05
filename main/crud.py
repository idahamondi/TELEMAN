from . import models

users = models.User
technicians = models.Technician
faults = models.Fault
network_components = models.NetworkComponent
notifications = models.Notification
counters = models.Counters
configuration_settings = models.ConfigurationSettings

class Faults:
    def create(fault_id, date_reported, description, status, priority_level, resolution_start_time, resolution_end_time, assigned_technician_id, affected_component_id, reported_user_id):
        data = faults.objects.create(
            fault_id = fault_id,
            date_reported = date_reported,
            description = description,
            status = status,
            priority_level = priority_level,
            resolution_start_time = resolution_start_time,
            resolution_end_time = resolution_end_time,
            assigned_technician_id = assigned_technician_id,
            affected_component_id = affected_component_id,
            reported_user_id = reported_user_id,
        )
        return data
    
    def read(param):
        data = faults.objects.all().order_by(param)
        return data

    def readXid(fault_id):
        data = faults.objects.filter(fault_id = fault_id)
        return data

    def update_data(fault_id, param, value):
        data = faults.objects.get(fault_id = fault_id)
        setattr(data, param, value)
        try:
            data.save()
            return True
        except:
            return False
    
    def update(fault_id, date_reported, description, status, priority_level, resolution_start_time, resolution_end_time, assigned_technician_id, affected_component_id, reported_user_id):
        data = faults.objects.filter(fault_id = fault_id).update(
            date_reported = date_reported,
            description = description,
            status = status,
            priority_level = priority_level,
            resolution_start_time = resolution_start_time,
            resolution_end_time = resolution_end_time,
            assigned_technician_id = assigned_technician_id,
            affected_component_id = affected_component_id,
            reported_user_id = reported_user_id,
        )
        return True if data >= 1 else False
    
    def delete(fault_id):
        data = faults.objects.get(fault_id = fault_id)
        try:
            data.delete()
            return True
        except:
            return False
    def count():
        return faults.objects.count()
        
class Notifications:
    def create(notification_id, message, status, type, created_at, user_id, fault_id):
        data = notifications.objects.create(
            notification_id = notification_id,
            message = message,
            status = status,
            type = type,
            created_at = created_at,
            user_id = user_id,
            fault_id = fault_id,
        )
        return data
    
    def read(param):
        data  = notifications.objects.all().order_by(param)
        return data
    
    def readXid(notification_id):
        data = notifications.objects.filter(notification_id = notification_id)
        return data
    
    def readXfault_id(fault_id):
        data = notifications.objects.filter(fault_id = fault_id)
        return data
    
    def update_data(notification_id, param, value):
        data = notifications.objects.get(notification_id = notification_id)
        setattr(data, param, value)
        try:
            data.save()
            return True
        except:
            return False
    
    def update(notification_id, message, status, type, created_at, user_id, fault_id):
        data = notifications.objects.filter(notification_id = notification_id).update(
            notification_id = notification_id,
            message = message,
            status = status,
            type = type,
            created_at = created_at,
            user_id = user_id,
            fault_id = fault_id,
         )
        return True if data >= 1 else False
    
    def delete(notification_id):
        data = notifications.objects.get(notification_id = notification_id)
        try:
            data.delete()
            return True
        except:
            return False

class Users:
    def create(user_id, name, role, contact_info, email, password, location):
        data = users.objects.create(
            user_id = user_id,
            name = name,
            role = role,
            contact_info = contact_info,
            email = email,
            password = password,
            location = location,
        )
        return data
    
    def read(param):
        data = users.objects.all().order_by(param)
        return data
    
    def readXid(user_id):
        data = users.objects.filter(user_id = user_id)
        return data
    
    def update_data(user_id, param, value):
        data = users.objects.get(user_id = user_id)
        setattr(data, param, value) 
        try:
            data.save()
            return True
        except:
            return False
    
    def update(user_id, name, role, contact_info, email, password, location):
        data = users.objects.filter(user_id = user_id).update(
            user_id = user_id,
            name = name,
            role = role,
            contact_info = contact_info,
            email = email,
            password = password,
            location = location,
        )
        return True if data >= 1 else False
    
    def delete(user_id):
        data = users.objects.get(user_id = user_id)
        try:
            data.delete()
            return True
        except:
            return False

class Technicians:
	def create(technician_id, name, username, password, email, contact_info, skillset, availability):
		data = technicians.objects.create(
			technician_id = technician_id,
			name = name,
			username = username,
			password = password,
			email = email,
			contact_info = contact_info,
			skillset = skillset,
			availability = availability,
		)
		return data
	
	def read(param):
		data = technicians.objects.all().order_by(param)
		return data
	
	def readXid(technician_id):
		data = technicians.objects.filter(technician_id = technician_id)
		return data
	
	def update_data(technician_id, param, value):
		data = technicians.objects.get(technician_id = technician_id)
		setattr(data, param, value)
		try:
			data.save()
			return True
		except:
			return False

	def update(technician_id, name, username, password, email, contact_info, skillset, availability):
		data = technicians.objects.filter(technician_id = technician_id).update(
			technician_id = technician_id,
			name = name,
			username = username,
			password = password,
			email = email,
			contact_info = contact_info,
			skillset = skillset,
			availability = availability,
		)
		return True if data>= 1 else False

	def delete(technician_id):
		data = technicians.objects.get(technician_id = technician_id)
		try:
			data.delete()
			return True
		except:
			return False

class NetworkComponents:
    def create(component_id, date_added, type, manufacturer, affects_uptime, location, status):
        data = network_components.objects.create(
            component_id = component_id,
            type = type,
            date_added = date_added,
            manufacturer = manufacturer,
            affects_uptime = affects_uptime,
            location = location,
            status = status,
        )
        return data
    
    def read(param):
        data  = network_components.objects.all().order_by(param)
        return data

    def readXid(component_id):
        data = network_components.objects.filter(component_id = component_id)
        return data

    def update_data(component_id, param, value):
        data = network_components.objects.get(component_id = component_id)
        setattr(data, param, value)
        try:
            data.save()
            return True
        except:
            return False
       
    def update(component_id, date_added, type, manufucturer, affects_uptime, location, status):
        data = network_components.objects.filter(component_id = component_id).update(
            component_id = component_id,
            type = type,
            date_added = date_added,
            manufucturer = manufucturer,
            affects_uptime = affects_uptime,
            location = location,
            status = status,
        )
        return True if data >= 1 else False
   
    def delete(component_id):
        data = network_components.objects.get(component_id = component_id)
        try:
            data.delete()
            return True
        except:
            return False

class ConfigurationSettings:
    def create(configuration_id, details):
        data = configuration_settings.objects.create(
            configuration_id = configuration_id,
            details = details,
        )
        return data
    
    def read(param):
        data  = configuration_settings.objects.all().order_by(param)
        return data

    def readXid(configuration_id):
        data = configuration_settings.objects.filter(configuration_id = configuration_id)
        return data

    def update_data(configuration_id, param, value):
        data = configuration_settings.objects.get(configuration_id = configuration_id)
        setattr(data, param, value)
        try:
            data.save()
            return True
        except:
            return False
       
    def update(configuration_id, details):
        data = configuration_settings.objects.filter(configuration_id = configuration_id).update(
            configuration_id = configuration_id,
            details = details,
        )
        return True if data >= 1 else False
   
    def delete(configuration_id):
        data = configuration_settings.objects.get(configuration_id = configuration_id)
        try:
            data.delete()
            return True
        except:
            return False
        
class Counters:
    def create(name, value, last_updated):
        data = counters.objects.create(
            name=name,
            value=value,
            last_updated=last_updated,
        )
        return data

    def read(param):
        data = counters.objects.all().order_by(param)
        return data

    def readXname(name):
        data = counters.objects.filter(name=name)
        return data

    def update_data(name, value):
        data = counters.objects.get(name=name)
        setattr(data, "value", value)
        try:
            data.save()
            return True
        except:
            return False

    def update(name, value, last_updated):
        data = counters.objects.filter(name=name).update(
            value=value,
            last_updated=last_updated,
        )
        return True if data >= 1 else False

    def delete(name):
        data = counters.objects.get(name=name)
        try:
            data.delete()
            return True
        except:
            return False