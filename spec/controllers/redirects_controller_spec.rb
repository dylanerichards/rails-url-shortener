require 'rails_helper'

describe RedirectsController do

  describe "GET #handle" do
    it 'redirects to the long url of a given short path' do
      url = Url.create(long_url: "www.wwe.com")

      get :handle, params: { short_path: url.short_path }

      expect(response).to redirect_to url.long_url
    end
  end

end
