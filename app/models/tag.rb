class Tag < ApplicationRecord
  has_many :task, through: :task_tag
end
