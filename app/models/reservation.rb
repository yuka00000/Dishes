class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :date, presence: true
  validates :time, presence: true, uniqueness: { scope: [:date, :restaurant_id] }
  validates :time, numericality: { message: "は予約できません。他の日程で再度お試しください。" }
  validates :people_count, presence: true
  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end

  def date_before_start
    errors.add(:date, "は過去の日付は選択できません。") if date < Date.current
  end

  def date_current_today
    errors.add(:date, "は当日は選択できません。") if date < (Date.current + 1)
  end

  def date_three_month_end
    errors.add(:date, "は3ヶ月以降の日付は選択できません。") if (Date.current >> 3) < date
  end

end
