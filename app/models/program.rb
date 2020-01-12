class Program < ApplicationRecord
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
