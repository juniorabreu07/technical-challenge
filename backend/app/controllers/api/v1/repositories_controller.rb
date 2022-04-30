# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController

      def search(param)
      end

      def index
        sincronize = user_params[:sincronize].nil? ? false : ActiveModel::Type::Boolean.new.cast(user_params[:sincronize])
        search = user_params[:search]

        unless search.nil?
          sincronize = false
          search = "*" if search.blank?
        end
        response = User.validated_and_create_or_update( user_params[:username], sincronize )
        unless response[:error]
          unless search.nil?
            response[:data] = Rails.cache.fetch("repositories#{user_params}_#{search}", expires_in: 1.minutes) do
              user = response[:data]
              response[:data] = Repository.search(search,where:{user_id:user.id})
            end
          else
            response[:data] = Rails.cache.fetch("repositories#{user_params}", expires_in: 1.minutes) do
              response[:data].repositories.to_a
            end
          end
        end

        render json: response, status: response[:status]
      end

      private
        def user_params
          params.permit(:username,:search,:sincronize)
        end
    end
  end
end
