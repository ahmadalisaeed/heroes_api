require 'jsonapi-serializers'

class AbilitySerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :name
  attribute :description
  attribute :is_ultimate

end