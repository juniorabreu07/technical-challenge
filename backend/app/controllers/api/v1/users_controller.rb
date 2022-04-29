# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        response = User.validated_and_create_or_update( user_params[:username] )

        render json: response, status: response[:status]
      end

      private

      def user_params
        # params.require(:user).permit(:username)
        params.permit(:username)
      end
    end
  end
end
