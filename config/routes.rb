Rails.application.routes.draw do
  get 'redirects/handle'

  post "/shorten", to: "urls#create"

  get "/:short_path", to: "redirects#handle"
end
