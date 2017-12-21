describe API::Abilities do

  describe "GET /api/heros/:hero_id/abilities", fdoc: '/api/heros/:hero_id/abilities' do
    it "should return list of hero ability" do
      get "/api/heroes/1/abilities"

      response_body = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(response_body['data'].class).to eq(Array)
    end

    context "with wrong hero_id" do
      it "should not return abilities" do
        get "/api/heros/WRONG_ID/abilities"
        expect(last_response.status).to eq(404)
      end
    end
  end

  describe "GET /api/abilities/", fdoc: '/api/abilities/' do
    it "should return list of abilities" do
      get "/api/abilities/"

      response_body = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(response_body['data'].class).to eq(Array)
    end
  end

  describe "GET /api/abilities/:id", fdoc: '/api/abilities/:id' do
    it "should return ability data" do
      get "/api/abilities/7"

      response_body = JSON.parse(last_response.body)

      expect(last_response).to be_ok
      expect(response_body["data"]["type"]).to eq("abilities")
      expect(response_body["data"]["id"]).to eq("7")
    end

    context "with wrong ability_id" do
      it "should not return ability" do
        get "/api/abilities/WRONG_ID"
        expect(last_response.status).to eq(404)
      end
    end
  end
end