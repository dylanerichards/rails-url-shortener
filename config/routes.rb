Rails.application.routes.draw do
  post "/shorten", to: "urls#create"

  get "/:short_path", to: "redirects#handle"
end
