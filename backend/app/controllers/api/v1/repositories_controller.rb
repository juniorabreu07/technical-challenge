# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        response = User.validated_and_create_or_update( user_params )
        unless response[:error]
          response[:data] = response[:data].repositories
        end

        render json: response, status: response[:status]
      end

      private
        def user_params
          params.require(:username)
        end
    end
  end
end
