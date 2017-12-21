class ResourceCollection < ActiveResource::Collection

	attr_accessor :next_page

	def initialize(parsed = {})
	  @elements = parsed['data']
	  @next_page = parsed['next_page']
	end
end