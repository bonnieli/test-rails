# frozen_string_literal: true

# Post model class
class Post < ApplicationRecord
  # Associations
  has_many :user_posts
  has_many :users, through: :user_posts, dependent: :destroy

  # Validations
  validates :text, presence: true, length: { minimum: 3 }
  validates :popularity, inclusion: { in: 0.0..1.0 }

  def tags
    if super
      super.split(",")
    end
  end

  def tags=(value)
    if value.kind_of? Array
      super value.join(",")
    else
      super value
    end
  end
end
