# frozen_string_literal: true

class Admin::ConfirmationsController < Devise::ConfirmationsController
  protected

  def after_sign_in_path_for(resource)
    admin_dashboards_path # ログイン後にリダイレクトするパス
  end

   def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path # ログアウト後にリダイレクトするパス
  end
  
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
