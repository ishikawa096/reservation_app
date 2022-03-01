class Room < ApplicationRecord
  belongs_to :user
  has_one :reservation
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 25 }
  validates :address, presence: true, length: { maximum: 25 }
  validates :rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :introduction, presence: true
  validates :image, presence: true

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
end
