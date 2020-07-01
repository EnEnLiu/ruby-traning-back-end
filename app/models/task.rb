class Task < ApplicationRecord
  belongs_to :user
  has_many :tag, through: :task_tag
  
end
