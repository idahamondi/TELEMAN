from . import views
from django.urls import path, include

urlpatterns = [
    path('', views.home, name='home'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('network/', views.network, name='network'),
    
    path('technicians/', views.technicians, name='technicians'),
    path('technicians_api/', views.technicians_api, name='technicians-api'),
    path('technician/', views.technician, name='technician'),
    path('update_technician_data/', views.update_technician_data, name='update-technician-data'),
    
    path('users/', views.users, name='users'),
    path('users_api/', views.users_api, name='users-api'),
    path('user/', views.user, name='user'),
    path('update_user_data/', views.update_user_data, name='update-user-data'),
    
    path('faults/', views.faults, name='faults'),
    path('faults_api/', views.faults_api, name='faults-api'),
    path('fault/', views.fault, name='fault'),
    path('update_fault_data/', views.update_fault_data, name='update-fault-data'),
    
    path('network_components/', views.network_components, name='network-component'),
    path('network_components_api/', views.network_components_api, name='network-component-api'),
    path('network_component/<id>/', views.network_component, name='network-component'),
    path('update_network_component_data/', views.update_network_component_data, name='update-network-component-data'),
    
    path('notifications/', views.notifications, name='notifications'),
    path('notifications_api/', views.notifications_api, name='notifications-api'),
    path('notification/', views.notification, name='notification'),
    path('update_notification_data/', views.update_notification_data, name='update-notification-data'),
    
    path('configuration_settings/', views.configuration_settings, name='configuration-settings'),
    path('configuration_settings_api/', views.configuration_settings_api, name='configuration-settings-api'),
    path('configuration_setting/', views.configuration_setting, name='configuration-setting'),
    path('update_configuration_setting_data/', views.update_configuration_setting_data, name='update-configuration-setting-data'),
    
    path('report_fault/', views.report_fault, name='report-fault'),
    path('update_fault/', views.update_fault, name='update-fault'),
    path('fault/<id>/', views.display_fault, name='display-fault'),
]