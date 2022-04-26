# frozen_string_literal: true

class UserPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
