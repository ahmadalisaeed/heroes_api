require 'jsonapi-serializers'

class HeroSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :name
  attribute :real_name
  attribute :health
  attribute :armour
  attribute :shield

  def type
    'heroes'
  end
end