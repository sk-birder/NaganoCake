# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # is_active判定用メソッドの呼び出し createであることに注意
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # サインイン後にhomes#topに遷移（不要かも） <- root_path遷移のため削除
  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  # # サインアウト後にhomes#topに遷移（不要かも） <- root_path遷移のため削除
  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
  def customer_state
    # 入力されたemailがCustomerモデルに存在するか判定
    customer = Customer.find_by(email: params[:customer][:email])
    # 存在しなければreturn
    return if customer.nil?
    # 存在すればパスワードの照合 不一致ならばreturn
    return unless customer.valid_password?(params[:customer][:password])
    # パスワード一致てもis_activeがfalseならばサインアップ画面へ遷移
    redirect_to new_customer_registration_path unless customer.is_active
  end
end
