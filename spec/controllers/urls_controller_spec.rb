require 'rails_helper'

describe UrlsController do

  describe "POST #create" do
    it 'creates a new url' do
      expect {
        post :create, params: { long_url: "www.wwe.com" }
      }.to change(Url, :count).by 1
    end

    it 'accepts an optional slug' do
      expect {
        post :create, params: { long_url: "www.wwe.com", slug: "this-is-a-slug" }
      }.to change(Url, :count).by 1
    end

    it 'returns the created url object' do
      post :create, params: { long_url: "www.wwe.com", slug: "this-is-a-slug" }

      body = JSON.parse(response.body)
      url = Url.last

      expect(body["id"]).to eq url.id
    end
  end
end
