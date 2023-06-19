class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     
  def after_sign_in_path_for(resource)
    root_path
  end


  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def search
    @q = Shop.ransack(params[:q])
    @shop = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
