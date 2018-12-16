# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def create
    user = User.where(email: user_params[:email]).first

    if user&.valid_password?(user_params[:password])
      render json: user.as_json(only: [:email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
