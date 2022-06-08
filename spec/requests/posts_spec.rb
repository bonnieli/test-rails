# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'rails_helper'
require 'json'

"""
// ---------------------------------------------------------------- //
//                                                                  //
//                 PLEASE DO NOT MODIFY THIS FILE.                  //
//               Hatchways automation depends on it.                //
//                                                                  //
// ---------------------------------------------------------------- //
"""

RSpec.describe 'Posts', type: :request do
  # Initialize the data

  let(:user) { create(:user) }
  let(:query_params) { { authorIds: user.id } }
  let(:update_params) { { tags: ['travel', 'vacation'], text: 'my text', authorIds: [1, 5] } }
  let(:update_text_params) { { text: 'new text' } }
  let (:post1) { create(:post) }
  let (:post2) { create(:post) }
  let (:post3) { create(:post) }

  before {
    for post in [post1, post2, post3]
      UserPost.create(user: user, post: post)
    end
  }


  describe 'GET /api/posts' do
    context 'when the request is valid' do
      it 'should return all posts of author ID in specific order.' do
        get "/api/posts", params: query_params, headers: valid_headers

        expected_posts = { posts: [] }

        for post in [post1, post2, post3]
          expected_posts[:posts] << {
            tags: post.tags.split(","),
            id: post.id, 
            text: post.text,
            likes: post.likes,
            reads: post.reads,
            popularity: post.popularity
        }
        end

        expect(JSON.parse(response.body)).to eq(JSON.parse(expected_posts.to_json))
        expect(response).to have_http_status(200)
        
      end

    end
  end

  describe 'PATCH /api/posts/:postId' do 

    context 'when the request is valid' do 
      it 'should update properties of a post.' do 
        patch "/api/posts/#{post1.id}", params: update_params, headers: valid_headers, as: :json

        expected_post = {
          post: {
            authorIds: [1, 5],
            id: post1.id, 
            likes: post1.likes, 
            popularity: post1.popularity,
            reads: post1.reads,
            tags: ['travel', 'vacation'],
            text: 'my text'
          }
        }

        expect(JSON.parse(response.body)).to eq(JSON.parse(expected_post.to_json))
        expect(response).to have_http_status(200)
      end

      it 'should update text property of a post.' do
        patch "/api/posts/#{post3.id}", params: update_text_params, headers: valid_headers, as: :json

        expected_post = {
          post: {
            authorIds: [user.id],
            id: post3.id, 
            likes: post3.likes, 
            popularity: post3.popularity,
            reads: post3.reads,
            tags: post3.tags.split(","),
            text: 'new text'
          }
        }
      end
    end

  end
end

# rubocop: enable Metrics/BlockLength
