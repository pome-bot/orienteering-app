class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orienteering_users
  has_many :orienteerings, through: :orienteering_users
  has_many :host_orienteerings, foreign_key: "host_id", class_name: "Orienteering", dependent: :destroy
  has_many :answers

  validates :name, presence: true

end
