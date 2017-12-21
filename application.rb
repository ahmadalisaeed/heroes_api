require File.expand_path('../environment', __FILE__)

module API
end

require 'app/api/base'
require 'app/models/resource_collection'
require 'app/models/base_resource'
require 'app/serializers/ability_serializer'
require 'app/serializers/hero_serializer'

Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}



class API::Root < Grape::API
  format :json

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount API::Heroes
  mount API::Abilities

  add_swagger_documentation mount_path: '/api/doc',
                            api_version: 'v1',
                            markdown: true,
                            hide_documentation_path: true,
                            base_path: Application.config.base_path
end

ApplicationServer = Rack::Builder.new {
  if ['production', 'staging'].include? Application.config.env
    use Rack::SslEnforcer
  end

  map "/api/" do
    run API::Root
  end
}
