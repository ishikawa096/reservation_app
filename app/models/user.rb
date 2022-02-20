class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reservations
  has_one_attached :icon

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  before_create :default_icon
  def default_icon
    if !self.icon.attached?
      self.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_icon.jpg')), filename: 'default_icon.jpg', content_type: 'image/jpg')
    end
  end
end
