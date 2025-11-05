from . import main
from datetime import datetime, date
from django.http import JsonResponse, HttpResponse
from rest_framework.decorators import api_view
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
import time

@login_required
def home(request):
    return render(
        request,
        'pages/home.html'
    )

@login_required
def network(request):
    current_user = request.user
    
    devices = main.NetworkComponents.read()
    locations = []
    devices_by_location = {}
    for device in devices:
        if device["location"] not in locations:
            locations.append(device["location"])
            devices_by_location[device["location"]] = []
    for devl in devices_by_location:
        for device in devices:
            if device["location"] == devl:
                devices_by_location[devl].append(device)
    
    user_info = main.ExtractUserInfo(current_user, "username")
    
    context = {}
    if user_info["type"] == "admin" or user_info["type"] == "technician":
        context = devices_by_location
    elif user_info["type"] == "user":
        context = {
            user_info["location"]: devices_by_location[user_info["location"]]
        }
    
    return render(
        request,
        'pages/network.html',
        {
            'user': current_user,
            'devices': context,
            'user_type': user_info["type"]
        }
    )

@login_required
def dashboard(request):
    current_user = request.user
    
    print(main.QualityMetrics.network_downtime())
    print(main.QualityMetrics.network_uptime(1732500000))
    print(main.QualityMetrics.response_time())
    
    return render(
        request,
        'pages/dashboard.html',
        {
            'data': main.NetworkStatus(current_user),
            'data_response': main.QualityMetrics.response_time(),
            'data_network': main.QualityMetrics.network_downtime(),
            'data_network_uptime': main.QualityMetrics.network_uptime(1732500000),
        }
    )

@api_view(['POST'])
def report_fault(request):
    if request.method == 'POST':
        values = request.POST
        report_status = main.ReportFault(
            values["device_id"],
            values["assigned_technician"],
            values["user"],
            values["priority"],
            values["description"]
        )
        return JsonResponse({
            'data': report_status,
        })

@api_view(['POST'])
def update_fault(request):
    if request.method == 'POST':
        values = request.POST
        main.Faults.update_data({
            "id": values["fault_id"],
            "param": "status",
            "value": values["status"],
        })
        main.Faults.update_data({
            "id": values["fault_id"],
            "param": values["resolution_time"],
            "value": int(datetime.now().timestamp()),
        })
        main.Technicians.update_data({
            "id": values["assigned_technician_id"],
            "param": "availability",
            "value": values["availability"],
        })
        if values["status"] == "resolution_start":
            message = f'{values["fault_id"]} is being resolved'
        elif values["status"] == "resolution_end":
            main.NetworkComponents.update_data({
                "id": values["affected_component_id"],
                "param": "status",
                "value": 1,
            })
            message = f'{values["fault_id"]} has been resolved successfully'
        
        fault = main.Faults.readXid({"id": values["fault_id"]})
        main.NotifyAdmins(message, values["status"], values["fault_id"])
        if fault["reported_user_id"] != None:
            main.CreateNotification(message, values["status"], values["reported_user_id"], values["fault_id"])
        if values["status"] == "resolution_end":
            time.sleep(2)
            main.UpdateNotificationsByFault(values["fault_id"])
        return JsonResponse({
            'data': "SUCCESS",
        })

@login_required
def display_fault(request, id):
    current_user = request.user
    user_info = main.ExtractUserInfo(current_user, "username")
    if user_info["type"] == "user":
        allow_status = 3
    elif user_info["type"] == "technician":
        allow_status = 2
    elif user_info["type"] == "admin":
        allow_status = 1
    else:
        allow_status = 3
    if allow_status == 3:
        location = user_info["location"]
    else:
        location = "global"
    return render(
        request,
        'pages/fault.html',
        {
            'fault': main.Faults.readXid({"id": id}),
            'allow_status': allow_status,
            'location': location,
            'id': user_info["id"],
        }
    )

@login_required
@api_view(['GET'])
def technicians(request):
    if request.method == "GET":
        return render(
            request,
            'pages/technicians.html',
            {
                'data': main.Technicians.read(),
            }
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def technicians_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Technicians.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.Technicians.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.Technicians.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.Technicians.delete(data),
        })

@api_view(['POST'])
def technician(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Technicians.readXid(data),
        })

@api_view(['POST'])
def update_technician_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Technicians.update_data(data),
        })

@login_required
@api_view(['GET'])
def users(request):
    if request.method == "GET":
        return render(
            request,
            'pages/users.html',
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def users_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Users.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.Users.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.Users.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.Users.delete(data),
        })

@api_view(['POST'])
def user(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Users.readXid(data),
        })

@api_view(['POST'])
def update_user_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Users.update_data(data),
        })

@login_required
@api_view(['GET'])
def faults(request):
    if request.method == "GET":
        return render(
            request,
            'pages/faults.html',
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def faults_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Faults.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.Faults.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.Faults.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.Faults.delete(data),
        })

@api_view(['POST'])
def fault(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Faults.readXid(data),
        })

@api_view(['POST'])
def update_fault_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Faults.update_data(data),
        })

@login_required
@api_view(['GET'])
def network_components(request):
    if request.method == "GET":
        return render(
            request,
            'pages/network_components.html',
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def network_components_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.NetworkComponents.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.NetworkComponents.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.NetworkComponents.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.NetworkComponents.delete(data),
        })

@login_required
def network_component(request, id):
    return render(
        request,
        'pages/network_component.html',
        {
            'device': main.NetworkComponents.readXid({"id": id}),
            'configuration': main.ConfigurationSettings.readXid({"id": main.NetworkComponents.readXid({"id": id})["configuration_id"]}),
        }
    )

@api_view(['POST'])
def update_network_component_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.NetworkComponents.update_data(data),
        })

@login_required
@api_view(['GET'])
def notifications(request):
    if request.method == "GET":
        return render(
            request,
            'pages/notifications.html',
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def notifications_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Notifications.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.Notifications.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.Notifications.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.Notifications.delete(data),
        })

@api_view(['POST'])
def notification(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Notifications.readXid(data),
        })

@api_view(['POST'])
def update_notification_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.Notifications.update_data(data),
        })

@login_required
@api_view(['GET'])
def configuration_settings(request):
    if request.method == "GET":
        return render(
            request,
            'pages/configuration_settings.html',
        )

@api_view(['POST', 'PUT', 'PATCH', 'DELETE'])
def configuration_settings_api(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.ConfigurationSettings.read(),
        })
    if request.method == 'PUT':
        return JsonResponse({
            'data': main.ConfigurationSettings.create(data),
        })
    if request.method == 'PATCH':
        return JsonResponse({
            'data': main.ConfigurationSettings.update(data),
        })
    if request.method == 'DELETE':
        return JsonResponse({
            'data': main.ConfigurationSettings.delete(data),
        })

@api_view(['POST'])
def configuration_setting(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.ConfigurationSettings.readXid(data),
        })

@api_view(['POST'])
def update_configuration_setting_data(request):
    data = request.data
    if request.method == 'POST':
        return JsonResponse({
            'data': main.ConfigurationSettings.update_data(data),
        })

