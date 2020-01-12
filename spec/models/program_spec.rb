require 'rails_helper'

RSpec.describe Program, type: :model do
  let(:program) { build(:program) }

  it 'creates program' do
    program.save!
  end
end
