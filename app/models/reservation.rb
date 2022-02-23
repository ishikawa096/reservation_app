class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :num_people, presence: true, numericality: { only_integer: true }
  validates :charge, presence: true, numericality: { only_integer: true }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :num_people_minimum_is_1
  validate :start_at_is_after_today
  validate :end_at_is_after_start_at

  def num_people_minimum_is_1
    if num_people <= 0
      errors.add(:num_people, "は1人以上入力してください")
    end
  end

  def start_at_is_after_today
    if start_at == nil || start_at < Date.today
      errors.add(:start_at, "は今日以降の日付を選択してください")
    end
  end

  def end_at_is_after_start_at
    if end_at != nil && start_at != nil
      errors.add(:end_at, "を開始日より前の日付にすることはできません") if end_at < start_at
    end
  end
end
