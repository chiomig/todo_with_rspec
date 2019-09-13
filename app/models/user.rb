class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, :lastname, presence: true

  has_many :tasks

  def due_today
    self.tasks.select{ |t| t.due_date.to_date == DateTime.now.utc.to_date }
  end
end
