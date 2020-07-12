class Task < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :task_tag

  validates :title, presence: true
end
