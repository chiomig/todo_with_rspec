class Task < ApplicationRecord
  validates :name, :priority, :due_date, presence: true

  belongs_to :user
end
