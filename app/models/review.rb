class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :player

  validates :body, presence: true, length: { maximum: 140 }
end
