# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        sincronize = user_params[:sincronize].nil? ? false : ActiveModel::Type::Boolean.new.cast(user_params[:sincronize])
        response = User.validated_and_create_or_update( user_params[:username], sincronize )
        unless response[:error]
          response[:data] = Rails.cache.fetch("repositories#{user_params}", expires_in: 1.minutes) do
            response[:data].repositories.to_a
          end
        end

        render json: response, status: response[:status]
      end

      private
        def user_params
          params.permit(:username,:sincronize)
        end
    end
  end
end
