class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def after_sign_up_path_for(resource)
  #   case resource
  #   when :restaurant
  #     restaurant_info_top_path
  #   when :user
  #     root_path
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when :restaurant
  #     restaurant_info_top_path
  #   when :user
  #     root_path
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when :restaurant
  #     restaurant_info_top_path
  #   when :user
  #     root_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name, :email, :phone_number, :name, :explanation, :post_code, :address, :price_lower_limit, :price_upper_limit, :hp_url, :reservation_method, :opening_time, :closing_time])
  end

end
