class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :login_required
  helper_method :logged_in?

  unless Rails.env.development?
    rescue_from Exception,                      with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,   with: :_render_404
    rescue_from ActionController::RoutingError, with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def render_404(e = nil)
    logger.info "Rendering 404 with excaption: #{e.message}" if e
    render 'errors/404', status: :not_found, layour: "error"
  end

  def render_500(e = nil)
    logger.error "Rendering 500 with excaption: #{e.message}" if e
    render "errors/500.html", status: :internal_server_error, layout: "error"
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to root_path unless current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
