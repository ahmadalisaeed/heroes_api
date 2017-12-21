class API::Heroes < API::Base
  
  desc "Returns hero details"

  get '/heroes/:hero_id' do
    hero = Hero.find params[:hero_id]
    JSONAPI::Serializer.serialize(hero)
  end

  desc "Returns list of heroes"

  get '/heroes' do
    JSONAPI::Serializer.serialize(Hero.all, is_collection: true)
  end
end