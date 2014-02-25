class ApplicationController < ActionController::Base
  def login
    sign_out
    sign_in(User.find(params[:id]))
    redirect_to root_path
  end
end

routes = Rails.application.routes
begin
  routes.disable_clear_and_finalize = true
  routes.clear!
  Rails.application.routes_reloader.paths.each{ |path| load(path) }
  routes.draw do
    get "login/:id" => "application#login", as: :login
  end
  ActiveSupport.on_load(:action_controller) { routes.finalize! }
ensure
  routes.disable_clear_and_finalize = false
end
