class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :rate, presence: true
  validates :introduction, presence: true

  def self.search(area,keyword)
    if area.present? && keyword.blank?
      where('address like?', "%#{area}%")
    elsif keyword.present? && area.blank?
      where('introduction like? OR name like?', "%#{keyword}%", "%#{keyword}%")
    else
      @search = where('address like?', "%#{area}%")
      @search.where('introduction like? OR name like?', "%#{keyword}%", "%#{keyword}%")
    end
  end

  before_create :default_image
  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_image.jpg')), filename: 'default_image.jpg', content_type: 'image/jpg')
    end
  end
end
