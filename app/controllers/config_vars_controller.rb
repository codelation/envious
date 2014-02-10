class ConfigVarsController < ApplicationController
  def create
    url     = "https://api.heroku.com/schema"
    options = { default_headers: { 'Accept' => 'application/vnd.heroku+json; version=3', 'Authorization' => "Bearer #{current_user.token}" } }
    client  = Heroics.client_from_schema_url(url, options)

    client.config_var.update(params[:app_id], { params[:config_var][:name] => params[:config_var][:value] })
    redirect_to app_path(params[:app_id])
  end
end
