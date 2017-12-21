require 'activeresource'

class BaseResource < ::ActiveResource::Base
	self.include_format_in_path = false
	self.site = "https://overwatch-api.net/api/v1"
  self.collection_parser = ResourceCollection
end
