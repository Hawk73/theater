class Program < ApplicationRecord
  validates :title, :activity_period, presence: true

  validate :validate_uniqueness_of_activity_period

  private

  def validate_uniqueness_of_activity_period
    return unless activity_period
    errors.add(:activity_period, "can't be crossed with another") if has_activity_intersection?
  end

  def has_activity_intersection?
    Program.where('activity_period && daterange(?, ?)', activity_period.first, activity_period.end).any?
  end
end

# == Schema Information
#
# Table name: programs
#
#  id              :bigint           not null, primary key
#  title           :string           not null
#  activity_period :daterange        not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
