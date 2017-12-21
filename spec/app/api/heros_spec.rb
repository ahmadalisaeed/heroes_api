describe API::Heroes do
  describe "GET /api/heroes", fdoc: '/api/heroes' do
    it "should return hero list" do

      get "/api/heroes/"

      response_body = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(response_body['data'].class).to eq(Array)
    end
  end

  describe "GET /api/heroes/:id", fdoc: '/api/heroes/:id' do
    it "should return hero data" do
      get "/api/heroes/7"

      response_body = JSON.parse(last_response.body)

      expect(last_response).to be_ok
      expect(response_body["data"]["type"]).to eq("heroes")
      expect(response_body["data"]["id"]).to eq("7")
    end
  end
end