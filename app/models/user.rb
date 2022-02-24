class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true, uniqueness: true, inclusion: { in: ["@"] },  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }

  before_create :default_icon
  def default_icon
    if !self.icon.attached?
      self.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_icon.jpg')), filename: 'default_icon.jpg', content_type: 'image/jpg')
    end
  end
end
