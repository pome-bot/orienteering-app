class Control < ApplicationRecord

  has_many :answers
  belongs_to :orienteering

end
