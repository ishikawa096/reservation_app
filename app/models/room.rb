class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

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
