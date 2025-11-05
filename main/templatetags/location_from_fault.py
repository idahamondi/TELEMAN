from django.template.defaulttags import register
from main.main import Faults, NetworkComponents

@register.filter
def location_from_fault(fault_id):
    return NetworkComponents.readXid({"id": Faults.readXid({"id": fault_id})["affected_component_id"]})["location"]