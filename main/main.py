from django.conf import settings
from . import crud, models
from django.core import serializers
import json
from datetime import datetime
from django.contrib.auth.hashers import make_password, check_password

users = models.User
technicians = models.Technician
faults = models.Fault
network_components = models.NetworkComponent
notifications = models.Notification
configuration_settings = models.ConfigurationSettings

DB = {
    'users': models.User,
    'technicians': models.Technician,
    'faults': models.Fault,
    'network_components': models.NetworkComponent,
    'notifications': models.Notification,
    'configuration_settings': models.ConfigurationSettings,
    'counter': models.Counters,
}

QUERY_ID = {
    'users': 'user_id',
    'technicians': 'technician_id',
    'faults': 'fault_id',
    'network_components': 'component_id',
    'notifications': 'notification_id',
    'configuration_settings': 'configuration_id',
    'counters': 'id'
}

PREFIX = {
    'users': 'USER-',
    'technicians': 'TECH-',
    'faults': 'FAULT-',
    'network_components': 'DEVICE-',
    'notifications': 'NOTIFY-',
    'configuration_settings': 'CONF-',
}

def QuerySetSerializer(queryset, scope):
    query_list = []
    query_json = json.loads(serializers.serialize('json', queryset))
    for set in query_json:
        query_list.append(set['fields'])
        set['fields'][QUERY_ID[scope]] = set['pk']
    return query_list

def QueryItemSerializer(queryobject, scope):
    query_list = []
    query_json = json.loads(serializers.serialize('json', queryobject))
    for set in query_json:
        query_list.append(set['fields'])
        set['fields'][QUERY_ID[scope]] = set['pk']
    return query_list[0] if query_list else 0

def generateQueryOrder(data):
    order_val = ''
    order_query = []
    for val in data:
        if (val['order'] == 'ASC'):
            order_val = '-'
        order_query.append(f'{order_val}{val["param"]}')
    return tuple(order_query)

def checkItemDB(table, field, value):
    global DB
    access = {field: value}
    try:
        item = DB[table].objects.get(**access)
    except:
        item = None
    if (not item):
        return False
    return True

def counter(target):
    current = QueryItemSerializer(crud.Counters.readXname(target), target)["value"]
    new = current+1
    crud.Counters.update(target, new, int(datetime.now().timestamp()))
    value = PREFIX[target] + str(new).zfill(4)
    return value

#########################

class Users():
    def create(data):
        try:
            crud.Users.create(
                user_id = counter("users"),
                name = data["name"],
                role = data["role"],
                contact_info = data["contact_info"],
                email = data["email"],
                password = make_password(data["password"]),
            )
            return 1
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.Users.readXid(data['id']), "users")
        return item

    def read():
        item = QuerySetSerializer(crud.Users.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["users"]
            }])
        ), "users")
        return item

    def update(data):
        item = crud.Users.update(
            user_id = data["id"],
            name = data["name"],
            role = data["role"],
            contact_info = data["contact_info"],
            email = data["email"],
            password = make_password(data["password"]),
        )
        return 1 if item == True else 0
    
    def update_data(data):
        item = crud.Users.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.Users.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.Users.delete(
            data['id']
        )
        return 1 if item == True else 0

class Faults():
    def create(data):
        try:
            fault_id = counter("faults")
            crud.Faults.create(
                fault_id = fault_id,
                date_reported = int(datetime.now().timestamp()),
                description = data["description"],
                status = data["status"],
                priority_level = data["priority_level"],
                resolution_start_time = None,
                resolution_end_time = None,
                assigned_technician_id = models.Technician(
                    technician_id = data['assigned_technician_id']
                ),
                affected_component_id = models.NetworkComponent(
                    component_id = data['affected_component_id']
                ),
                reported_user_id = models.User(
                    user_id = data['reported_user_id']
                ) if data['reported_user_id'] != None else None,
            )
            return fault_id
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.Faults.readXid(data['id']), "faults")
        return item

    def read():
        item = QuerySetSerializer(crud.Faults.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["faults"]
            }])
        ), "faults")
        return item
    
    def update_data(data):
        item = crud.Faults.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.Faults.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.Faults.delete(
            data['id']
        )
        return 1 if item == True else 0

class Notifications():
    def create(data):
        try:
            crud.Notifications.create(
                notification_id = counter("notifications"),
                message = data["message"],
                status = False,
                type = data["type"],
                created_at = int(datetime.now().timestamp()),
                user_id = models.User(
                    user_id = data['user_id']
                ) if data['user_id'] != None else None,
                fault_id = models.Fault(
                    fault_id = data['fault_id']
                ),
            )
            return 1
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.Notifications.readXid(data['id']), "notifications")
        return item
    
    def readXfault_id(data):
        item = QuerySetSerializer(crud.Notifications.readXfault_id(data['id']), "notifications")
        return item

    def read():
        item = QuerySetSerializer(crud.Notifications.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["notifications"]
            }])
        ), "notifications")
        return item
    
    def update_data(data):
        item = crud.Notifications.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.Notifications.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.Notifications.delete(
            data['id']
        )
        return 1 if item == True else 0
    

class Technicians():
    def create(data):
        try:
            crud.Technicians.create(
                technician_id = counter("technicians"),
                name = data["name"],
                username = data["username"],
                email = data["email"],
                paswword = make_password(data["password"]),
                contact_info = data["contact_info"],
                skillset = data["skillset"],
                availability = data["availability"],
            )
            return 1
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.Technicians.readXid(data['id']), "technicians")
        return item

    def read():
        item = QuerySetSerializer(crud.Technicians.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["technicians"]
            }])
        ), "technicians")
        return item
    
    def update(data):
        item = crud.Technicians.update(
            technician_id = data["id"],
            name = data["name"],
            username = data["username"],
            password = make_password(data["password"]),
            email = data["email"],
            contact_info = data["contact_info"],
            skillset = data["skillset"],
            availability = data["availability"],
        )
        return 1 if item == True else 0
    
    def update_data(data):
        item = crud.Technicians.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.Technicians.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.Technicians.delete(
            data['id']
        )
        return 1 if item == True else 0

class NetworkComponents():
    def create(data):
        try:
            crud.NetworkComponents.create(
                component_id = counter("network_components"),
                date_added = int(datetime.now().timestamp()),
                type = data["type"],
                manufacturer = data["manufacturer"],
                affects_uptime = data["affects_uptime"],
                location = data["location"],
                status = data["status"],
            )
            return 1
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.NetworkComponents.readXid(data['id']), "network_components")
        return item

    def read():
        item = QuerySetSerializer(crud.NetworkComponents.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["network_components"]
            }])
        ), "network_components")
        return item
    
    def update(data):
        item = crud.NetworkComponents.update(
            component_id = data["id"],
            type = data["type"],
            manufacturer = data["manufacturer"],
            configuration_details = data["configuration_details"],
            affects_uptime = data["affects_uptime"],
            location = data["location"],
            status = data["status"],
        )
        return 1 if item == True else 0
    
    def update_data(data):
        item = crud.NetworkComponents.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.NetworkComponents.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.NetworkComponents.delete(
            data['id']
        )
        return 1 if item == True else 0
    

class ConfigurationSettings():
    def create(data):
        try:
            crud.ConfigurationSettings.create(
                configuraiton_id = counter("configuration_settings"),
                details = data["details"],
            )
            return 1
        except Exception as e:
            print(e)
            return 0

    def readXid(data):
        item = QueryItemSerializer(crud.ConfigurationSettings.readXid(data['id']), "configuration_settings")
        return item

    def read():
        item = QuerySetSerializer(crud.ConfigurationSettings.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["configuration_settings"]
            }])
        ), "configuration_settings")
        return item
    
    def update(data):
        item = crud.ConfigurationSettings.update(
            configuration_id = data["id"],
            details = data["details"],
        )
        return 1 if item == True else 0
    
    def update_data(data):
        item = crud.ConfigurationSettings.update_data(data["id"], data["param"], data["value"])
        return 1 if item == True else 0

    def delete(data):
        fetch = crud.ConfigurationSettings.readXid(data['id'])
        if not fetch.exists():
            return 2
        item = crud.ConfigurationSettings.delete(
            data['id']
        )
        return 1 if item == True else 0

class Reports:
    def uptime():
        faults = QuerySetSerializer(crud.Faults.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["faults"]
            }])
        ), "faults")
        network_components = QuerySetSerializer(crud.NetworkComponents.read(
            *generateQueryOrder([{
                'order': "DESC",
                'param': QUERY_ID["network_components"]
            }])
        ), "network_components")
        
def ExtractUserInfo(user, typeval="username"):
    technicians = QuerySetSerializer(crud.Technicians.read(
        *generateQueryOrder([{
            'order': "DESC",
            'param': QUERY_ID["technicians"]
        }])
    ), "technicians")
    users = QuerySetSerializer(crud.Users.read(
        *generateQueryOrder([{
            'order': "DESC",
            'param': QUERY_ID["users"]
        }])
    ), "users")
    
    system_users = [*users, *technicians]
    
    users_list = []
    admins_list = []
    technicians_list = []
    users_list_ID = []
    admins_list_ID = []
    technicians_list_ID = []
    
    for u in users:
        if u["role"] == "user":
            users_list.append(u["username"])
            users_list_ID.append(u["user_id"])
        elif u["role"] == "admin":
            admins_list.append(u["username"])
            admins_list_ID.append(u["user_id"])
    for technician in technicians:
        technicians_list.append(technician["username"])
        technicians_list_ID.append(technician["technician_id"])

    for system_user in system_users:
        if "role" in system_user:
            user_type = "user_id"
        else:
            user_type = "technician_id"
        user_rel = "username" if typeval == "username" else user_type
        if system_user[user_rel] == str(user):
            rel_listU = users_list if typeval == "username" else users_list_ID
            rel_listA = admins_list if typeval == "username" else admins_list_ID
            rel_listT = technicians_list if typeval == "username" else technicians_list_ID
            if system_user[user_rel] in rel_listU:
                return {
                    "username": system_user["username"],
                    "type": system_user["role"],
                    "name": system_user["name"],
                    "email": system_user["email"],
                    "id": system_user["user_id"],
                    "address": system_user["contact_info"]["address"],
                    "phone_number": system_user["contact_info"]["phone_number"],
                    "location": system_user["location"],
                }
            elif system_user[user_rel] in rel_listA:
                return {
                    "username": system_user["username"],
                    "type": system_user["role"],
                    "name": system_user["name"],
                    "email": system_user["email"],
                    "id": system_user["user_id"],
                    "address": system_user["contact_info"]["address"],
                    "phone_number": system_user["contact_info"]["phone_number"],
                    "location": system_user["location"],
                }
            elif system_user[user_rel] in rel_listT:
                return {
                    "username": system_user["username"],
                    "type": "technician",
                    "name": system_user["name"],
                    "email": system_user["email"],
                    "id": system_user["technician_id"],
                    "address": system_user["contact_info"]["address"],
                    "phone_number": system_user["contact_info"]["phone_number"],
                    "skillset": system_user["skillset"],
                    "availability": system_user["availability"],
                }

def CreateNotification(message, type, user_id, fault_id):
    notification_data = {
        "message": message,
        "type": type,
        "user_id": models.User(
            user_id = user_id
        ),
        "fault_id": models.Fault(
            fault_id = fault_id
        ),
    }
    create = Notifications.create(notification_data)
    return create

def NotifyAdmins(message, type, fault_id):
    admins_list = []
    admins_list_ID = []
    
    users = QuerySetSerializer(crud.Users.read(
        *generateQueryOrder([{
            'order': "DESC",
            'param': QUERY_ID["users"]
        }])
    ), "users")
    for u in users:
        if u["role"] == "admin":
            admins_list.append(u["username"])
            admins_list_ID.append(u["user_id"])
        
    for admin in admins_list_ID:
        CreateNotification(message, type, admin, fault_id)

def ReportFault(device_id, technician_id, user_id, priority, description):
    fault_data = {
        "description": description,
        "status": "reported",
        "priority_level": priority,
        "assigned_technician_id": technician_id,
        "affected_component_id" : device_id,
        "reported_user_id": ExtractUserInfo(user_id, "username")["id"] if ExtractUserInfo(user_id, "username")["type"] == "user" else None,
    }
    device_data = QueryItemSerializer(crud.NetworkComponents.readXid(device_id), "network_components")
    
    message = f'{device_data["type"]} with ID {device_id} reported'
    create_fault = Faults.create(fault_data)
    
    if create_fault:
        NotifyAdmins(message, "reported", create_fault)
        if ExtractUserInfo(user_id, "username")["type"] == "user":
            CreateNotification(message, "reported", ExtractUserInfo(user_id, "username")["id"], create_fault)
        NetworkComponents.update_data({
            "id": device_id,
            "param": "status",
            "value": False
        })

def ExtractTechnicians():
    technicians = QuerySetSerializer(crud.Technicians.read(
        *generateQueryOrder([{
            'order': "DESC",
            'param': QUERY_ID["technicians"]
        }])
    ), "technicians")
    available_technicians = []
    for technician in technicians:
        if technician["availability"] == True:
            available_technicians.append(technician)
    return {
        "all": technicians,
        "available": available_technicians
    }

def ExtractTechniciansBySkill(skill):
    available = ExtractTechnicians()["available"]
    available_by_skill = []
    for technician in available:
        if skill in technician["skillset"]:
            available_by_skill.append(technician["technician_id"])
    return available_by_skill

def ExtractTechniciansByComponent(skill):
    skill_mapping = {
        'cable': 'cable_management',
        'router': 'router_management',
        'switch': 'switch_management',
        'computer': 'computer_management',
        'repeater': 'repeater_management',
    }
    available = ExtractTechnicians()["available"]
    available_by_skill = []
    for technician in available:
        if skill_mapping[skill] in technician["skillset"]:
            available_by_skill.append(technician)
    return available_by_skill

class QualityMetrics:
    def network_downtime():
        faults = Faults.read()
        total_downtime = 0
        total_resolution_time = 0
        resolution_time_relation = []
        resolution_time_faults = []
        resolution_time_values = []

        for fault in faults:
            if fault["resolution_end_time"]:
                if NetworkComponents.readXid({"id": fault["affected_component_id"]})["affects_uptime"]:
                    downtime = fault["resolution_end_time"] - fault["date_reported"]
                    resolution_time = fault["resolution_end_time"] - fault["resolution_start_time"]
                    resolution_time_relation.append({
                        "fault_id": fault["fault_id"],
                        "resolution_time": resolution_time,
                    })
                    resolution_time_faults.append(fault["fault_id"])
                    resolution_time_values.append(resolution_time)
                    total_downtime += downtime
                    total_resolution_time += resolution_time
            else:
                if NetworkComponents.readXid({"id": fault["affected_component_id"]})["affects_uptime"]:
                    current = datetime.now().timestamp()
        return {
            "total_downtime": total_downtime,
            "resolution_times": json.dumps(resolution_time_relation),
            "resolution_time_faults": json.dumps(resolution_time_faults),
            "resolution_time_values": json.dumps(resolution_time_values),
        }

    def response_time():
        
        faults = Faults.read()

        total_response_time = 0
        responded_faults = 0
        for fault in faults:
            if fault["resolution_start_time"]:
                response_time = fault["resolution_start_time"] - fault["date_reported"]
                total_response_time += response_time
                responded_faults += 1

                average_response_time = (
                    total_response_time / responded_faults if responded_faults > 0 else 0
                )

        return {
            "average_response_time" : average_response_time,
            "total_response_time" : total_response_time,
            "responded_faults" : responded_faults,
            "total_faults" : len(faults)
        }
    
    def network_uptime(total_period):
        downtime_data = QualityMetrics.network_downtime()
        total_downtime = downtime_data["total_downtime"]
        total_period = datetime.now().timestamp() - total_period

        network_uptime = total_period - total_downtime
        percentage_uptime = (network_uptime / total_period) * 100

        return {
            "network_uptime" : network_uptime,
            "percentage_uptime" : percentage_uptime,
            "uptime_hours" : network_uptime / 3600,
            "total_downtime" : downtime_data["total_downtime"]
        }

def ExtractTechnicianAssignedFaults(technician):
    faults = QuerySetSerializer(crud.Faults.read(
        *generateQueryOrder([{
            'order': "DESC",
            'param': QUERY_ID["faults"]
        }])
    ), "faults")
    assigned_faults = []
    for fault in faults:
        if fault["assigned_technician_id"] == technician:
            assigned_faults.append(fault["fault_id"])
    return assigned_faults

def GenerateNotifications(user):
    notifications = QuerySetSerializer(crud.Notifications.read(
        *generateQueryOrder([{
            'order': "ASC",
            'param': QUERY_ID["notifications"]
        }])
    ), "notifications")
    user_info = ExtractUserInfo(user, "username")
    user_notifications = []
    assigned_faults = []
    assigned_faults_list = []
    if user_info["type"] == "technician":
        assigned_faults = ExtractTechnicianAssignedFaults(user_info["id"])
    for notification in notifications:
        if user_info["type"] != "technician":
            if notification["user_id"] == user_info["id"]:
                user_notifications.append(notification)
        else:
            if notification["fault_id"] in assigned_faults:
                if notification["fault_id"] not in assigned_faults_list:
                    user_notifications.append(notification)
                    assigned_faults_list.append(notification["fault_id"])
            
    return user_notifications

def UpdateNotificationsByFault(fault_id):
    notifications_by_fault = Notifications.readXfault_id({"id": fault_id})
    for n in notifications_by_fault:
        Notifications.update_data({
            "id": n["notification_id"],
            "param": "status",
            "value": 1
        })

def NetworkStatus(user):
    user_info = ExtractUserInfo(user, "username")
    user_type = user_info["type"]
    network_locations_online = 0
    network_locations = []
    network_locations_online_relation = {}
    devices = NetworkComponents.read()
    faults = Faults.read()
    technicians = Technicians.read()
    
    devices_count = len(devices)
    faults_count = len(faults)
    technicians_count = len(technicians)
    
    cables_count = 0
    switches_count = 0
    routers_count = 0
    repeaters_count = 0
    computers_count = 0
    
    for device in devices:
        if device["location"] not in network_locations:
            network_locations.append(device["location"])
            network_locations_online_relation[device["location"]] = 1
        if device["type"] == "cable":
            cables_count += 1
        if device["type"] == "switch":
            switches_count += 1
        if device["type"] == "router":
            routers_count += 1
        if device["type"] == "repeater":
            repeaters_count += 1
        if device["type"] == "computer":
            computers_count += 1
    
    for device in devices:
        if device["status"] == 0:
            if network_locations_online_relation[device["location"]] == 1:
                network_locations_online_relation[device["location"]] = 0
    for value in network_locations_online_relation.values():
        if value == 1:
            network_locations_online += 1
    network_locations_count = len(network_locations)
    
    return {
        "devices_count": devices_count,
        "technicians_count": technicians_count,
        "faults_count": faults_count,
        "network_locations_count": network_locations_count,
        "network_locations_online": network_locations_online,
        "cables_count": cables_count,
        "switches_count": switches_count,
        "routers_count": routers_count,
        "repeaters_count": repeaters_count,
        "computers_count": computers_count,
    }

