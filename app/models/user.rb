class User < ApplicationRecord
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true

  has_many :tasks

  def due_today
    self.tasks.select{ |t| t.due_date.to_date == DateTime.now.utc.to_date }
  end
end
