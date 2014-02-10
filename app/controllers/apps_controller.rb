class AppsController < ApplicationController
  def index
    url = "https://api.heroku.com/schema"
    options = {default_headers: {'Accept' => 'application/vnd.heroku+json; version=3', 'Authorization' => "Bearer #{current_user.token}"}}
    client = Heroics.client_from_schema_url(url, options)
    @apps = client.app.list
  end

  def show
    url = "https://api.heroku.com/schema"
    options = {default_headers: {'Accept' => 'application/vnd.heroku+json; version=3', 'Authorization' => "Bearer #{current_user.token}"}}
    client = Heroics.client_from_schema_url(url, options)
    @app = client.app.info(params[:id])
    @vars = client.config_var.info(params[:id])
  end
end
