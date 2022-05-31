# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # Initialize the data

  let(:user) { create(:user) }
  let(:query_params) { { authorIds: user.id } }
  let(:update_params) { { tags: ['travel', 'vacation'], text: 'my text', authorIds: [1, 5] } }
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

        for post in [post3, post2, post1]
          expected_posts[:posts] << {
            tags: post.tags.split(","),
            id: post.id, 
            text: post.text,
            likes: post.likes,
            reads: post.reads,
            popularity: post.popularity,
            createdAt: post.created_at,
            updatedAt: post.updated_at
        }
        end

        expect(response.body).to eq(expected_posts.to_json)
        expect(response).to have_http_status(200)
        
      end

    end
  end

  describe 'PUT /api/posts/:postId' do 

    context 'when the request is valid' do 
      it 'should update properties of a post.' do 
        put "/api/posts/#{post1.id}", params: update_params, headers: valid_headers

        expect(response.body).to eq({
          post: {
            authorIds: [1, 5],
            createdAt: post1.createdAt,
            id: post1.id, 
            likes: post1.likes, 
            popularity: post1.popularity,
            reads: post1.reads,
            tags: ['travel', 'vacation'],
            text: 'my text',
            updatedAt: post1.updatedAt
          }
        }.to_json)
        expect(response).to have_http_status(200)
      end
    end

  end
end

# rubocop: enable Metrics/BlockLength
