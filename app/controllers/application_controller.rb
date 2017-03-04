class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_up_path_for(_resource)
    dashboard_home_path
  end

  def after_sign_in_path_for(_resource)
    dashboard_home_path
  end

  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end

  rescue_from ActiveRecord::RecordNotUnique do
    render_400
  end

  rescue_from ActiveRecord::InvalidForeignKey do
    render_400
  end

  rescue_from ActionController::ParameterMissing do
    render_400
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit([:sign_in, :sign_up]) do |user_params|
      user_params.permit(:first_name, :last_name, :email, { registration_options: [:email_newsletter, :accept_privacy_policy] })
    end
  end

  def render_404
    respond_to do |format|
      format.json {
        render json: { error: "404 not-found" }.to_json, status: 404
      }
      format.html{
        render :file => "public/404.html", status: :not_found, layout: false
      }
    end
  end

  def render_400
    respond_to do |format|
      format.json {
        render json: { error: "400 client sent a poorly formed request" }.to_json, status: 400
      }
      format.html{
        render :file => "public/400.html", status: 400, layout: false
      }
    end
  end
end
