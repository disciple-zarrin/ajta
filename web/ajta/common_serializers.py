from rest_framework import serializers
<<<<<<< HEAD
from targetApp.models import *


class HistoricalIPSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistoricalIP
        fields = ['ip', 'location', 'owner', 'last_seen']


class RelatedDomainSerializer(serializers.ModelSerializer):
    class Meta:
        model = RelatedDomain
        fields = '__all__'


class NameServersSerializer(serializers.ModelSerializer):
    class Meta:
        model = NameServer
        fields = ['name']


class DomainRegistrarSerializer(serializers.ModelSerializer):
    class Meta:
        model = Registrar
        fields = ['name', 'phone', 'email', 'url']


class DomainRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainRegistration
        fields = [
            'name',
            'organization',
            'address',
            'city',
            'state',
            'zip_code',
            'country',
            'email',
            'phone',
            'fax'
        ]

class DomainWhoisStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = WhoisStatus
        fields = ['name']


class DomainDNSRecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = DNSRecord
        fields = ['name', 'type']
=======

from targetApp.models import *

class AssociatedDomainSerializer(serializers.ModelSerializer):
    class Meta:
        model = AssociatedDomain
        fields = '__all__'

class NameServersSerializer(serializers.ModelSerializer):
    class Meta:
        model = NameServers
        fields = ['name']

class DomainRegistrarSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainRegistrar
        fields = ['name']

class DomainRegisterNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainRegisterName
        fields = ['name']

class DomainRegisterOrganizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainRegisterOrganization
        fields = ['name']

class DomainAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainAddress
        fields = ['name']

class DomainCitySerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainCity
        fields = ['name']

class DomainStateSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainState
        fields = ['name']

class DomainZipCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainZipCode
        fields = ['name']

class DomainCountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainCountry
        fields = ['name']

class DomainEmailSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainEmail
        fields = ['name']

class DomainPhoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainPhone
        fields = ['name']

class DomainFaxSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainFax
        fields = ['name']

class DomainWhoisStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainWhoisStatus
        fields = ['status']

class DomainRegistrarIDSerializer(serializers.ModelSerializer):
    class Meta:
        model = DomainRegistrarID
        fields = ['name']
>>>>>>> d8e08d12274f9a1fe180c695d7e3eb1a06e38fa5
