class Tag < ApplicationRecord
  has_many :tasks, through: :task_tag
end
