class User < ApplicationRecord
  has_many :messages
  has_many :categories
end
