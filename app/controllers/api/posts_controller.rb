# frozen_string_literal: true

module Api
  # Posts controller
  class PostsController < ApplicationController
    def create
      post = current_user.posts.create!(post_params)
      render json: { post: post }, status: :created
    end

    private

    def post_params
      params.permit(:text, :likes, :reads, :popularity, tags: [])
    end
  end
end
