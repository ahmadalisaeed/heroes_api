class API::Base < Grape::API
  def self.inherited(subclass)
    super
    subclass.instance_eval do
      format :json
      rescue_from ActiveResource::ResourceNotFound do |e|
        message = e.message.gsub(/\s*\[.*\Z/, '')
        Rack::Response.new([{ status: 404, status_code: "not_found", error: message }.to_json],404)
      end
    end
  end
end