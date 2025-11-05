from django.template.defaulttags import register

@register.inclusion_tag('user.html')
def user(user):
    return {
        "data": user
    }