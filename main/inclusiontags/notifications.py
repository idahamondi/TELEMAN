from django.template.defaulttags import register
from main.main import GenerateNotifications
import json

@register.inclusion_tag('notifications_list.html')
def notifications(user):
    notification_data = GenerateNotifications(user)
    return {
        "notification_data": json.dumps(notification_data)
    }