# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController

      def search(param)
      end

      def index
        sincronize = user_params[:sincronize].nil? ? false : ActiveModel::Type::Boolean.new.cast(user_params[:sincronize])
        search     = user_params[:search]
        page       = [1, user_params[:page].to_i].max unless user_params[:page].nil?
        per_page   = [1, user_params[:per_page].to_i].max unless user_params[:per_page].nil?

        unless search.nil?
          sincronize = false
        end
        search = "*" if search.blank?
        response = User.validated_and_create_or_update( user_params[:username], sincronize )
        unless response[:error]
          response[:data] = Rails.cache.fetch("repositories#{user_params}_#{search}", expires_in: 1.minutes) do
            user = response[:data]
            response[:data] = Repository.search(search,where:{user_id:user.id}, execute: false, page: page, per_page: per_page).to_a
          end
        end

        render json: response, status: response[:status]
      end

      private
        def user_params
          params.permit(:username,:search,:sincronize,:page,:per_page)
        end
    end
  end
end
