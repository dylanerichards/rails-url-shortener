class RedirectsController < ApplicationController
  def handle
    url = Url.where(short_path: params[:short_path]).first

    redirect_to url.long_url
  end
end
