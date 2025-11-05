from django.template.defaulttags import register
from datetime import datetime, timezone, timedelta

@register.filter
def int_to_time(int):
    return datetime.fromtimestamp(int, tz=timezone.utc) + timedelta(seconds=60*60*3)