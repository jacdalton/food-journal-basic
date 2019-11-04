class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, PhotoUploader

  has_many :foods
  has_many :entries
  has_many :calorie_goals

  def self.check_profile_image(user)
    if user.profile_image.present?
      user.profile_image.url
    else
      'default_user.png'
    end
  end
end
