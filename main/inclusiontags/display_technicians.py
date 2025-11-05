from django.template.defaulttags import register
from main.main import ExtractTechniciansByComponent

@register.inclusion_tag('technicians_list.html')
def display_technicians(type):
    tech_data = ExtractTechniciansByComponent(type)
    return {
        'technician_data': tech_data
    }