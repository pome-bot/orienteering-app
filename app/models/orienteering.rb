class Orienteering < ApplicationRecord

  validates :name, presence: true

  has_many :orienteering_users
  has_many :users, through: :orienteering_users
  has_many :controls
  belongs_to :host, class_name: "User"

  def calc_scores
    array_users = []
    array_user_ids = []
    users.each do |user|
      array_users << user.name
      array_user_ids << user.id
    end
    array_user_scores = Array.new(users.length, 0)

    controls.each do |control|
      control.answers.each do |answer|
        if answer.answer == control.answer
          index = array_user_ids.index(answer.user_id)
          array_user_scores[index] += control.point.to_i
        end
      end
    end
    return array_user_scores
  end

end
