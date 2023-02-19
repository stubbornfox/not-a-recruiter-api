class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :google, :reset_password]

  # POST /auth/login
  def login # rubocop:todo Metrics/AbcSize
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email,
                     first_name: @user.first_name,
                     id: @user.id,
                     organization_ids: @user.organization_ids,
                     organization: @user.organization }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def google
    if GoogleAuthVerification.call(params[:id_token])
      @user = User.find_or_initialize_by(email: params[:email])
      @user.provider = :google_account
      @user.profile_picture_url = params[:picture]
      @user.full_name = params[:name]

      if @user.save
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email,
                     first_name: @user.first_name,
                     id: @user.id,
                     organization_ids: @user.organization_ids,
                     organization: @user.organization }, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Token not verified as issued by our app' }, status: :bad_request
    end
  end

  def reset_password
    if params[:reset_password_token].present? && @user = User.find_by(reset_password_token: params[:reset_password_token])
      @user.update(reset_password_params.merge(reset_password_token: nil))
      @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email,
                     first_name: @user.first_name,
                     id: @user.id,
                     organization_ids: @user.organization_ids,
                     organization: @user.organization }, status: :ok
    else
      render json: 'Invalid reset password token', status: :not_found
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def reset_password_params
    params.permit(:password, :password_confirmation)
  end
end
