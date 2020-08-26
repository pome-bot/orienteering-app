class Control < ApplicationRecord

  validates :name, presence: true
  validates :question, presence: true
  validates :answer, presence: true
  validates :position_lat, presence: true
  validates :position_lng, presence: true
  validates :point, presence: true

  has_many :answers
  belongs_to :orienteering

end
