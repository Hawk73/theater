FactoryBot.define do
  factory :program do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:activity_period) do |n|
      date = Date.new(2019, 1, 1) + n.days
      date..date
    end
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
