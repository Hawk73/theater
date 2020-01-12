require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'validation of title' do
    subject { build(:program) }

    context 'title is nil' do
      before { subject.title = nil }

      it 'adds error' do
        subject.validate
        expect(subject.errors.messages[:title]).to eq(["can't be blank"])
      end
    end
  end

  describe 'validation of activity_period' do
    let(:start_date) { Date.new(2019, 1, 1) }
    let(:end_date) { Date.new(2019, 1, 30) }

    subject { build(:program, activity_period: start_date..end_date) }

    context 'activity_period is nil' do
      before { subject.activity_period = nil }

      it 'adds error' do
        subject.validate
        expect(subject.errors.messages[:activity_period]).to eq(["can't be blank"])
      end
    end

    context 'another program for the same dates exists' do
      before { create(:program, activity_period: (end_date - 1.day)..(end_date + 1.day)) }

      describe 'checking in model' do
        it 'adds error' do
          subject.validate
          expect(subject.errors.messages[:activity_period]).to eq(["can't be crossed with another"])
        end
      end

      describe 'checking in DB' do
        it 'raises error' do
          expect { subject.save(validate: false) }.to raise_error(ActiveRecord::StatementInvalid)
        end
      end
    end

    context 'another program has different period' do
      before { create(:program, activity_period: (end_date + 1.day)..(end_date + 2.day)) }

      it 'does not add error' do
        subject.validate
        expect(subject.errors.messages[:activity_period]).to be_empty
      end
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
