class ApplicationController < ActionController::Base


  ###email & password 以外 の 値(役職・ユーザー名、プロフィール、所属) も 保存できるように追記する###
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:position, :name, :profile, :occupation]) #複数のパラメーターを送る際の記述
  end


end
