class User < ApplicationRecord
  has_many :task

  validates :name, presence: true,
                   length: { in: 1..10 }
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/ }
  validates :password, presence: true, 
                       length: { in: 6..20 },
                       confirmation: true
end