class API::Abilities < API::Base
  
  desc "Returns list of abilities"
  get '/abilities' do
    JSONAPI::Serializer.serialize(Ability.all, is_collection: true)
  end


  desc "Returns abilities details"

  get '/abilities/:ability_id' do
    ability = Ability.find params[:ability_id]
    JSONAPI::Serializer.serialize(ability)
  end

  desc "Returns abilities of a hero"

  get '/heroes/:hero_id/abilities' do
    hero = Hero.find params[:hero_id]
    JSONAPI::Serializer.serialize(hero.abilities, is_collection: true)
  end
end