class Goal < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validates :complete?, :private?, inclusion: { in: [true, false] }

  belongs_to :user
end
