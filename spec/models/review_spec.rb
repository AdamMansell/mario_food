# frozen_string_literal: true

require 'rails_helper'

describe Review do
  describe 'associations' do
    it { should belong_to :product }
  end

  describe 'validations' do
    it { should validate_presence_of :author }
    it { should validate_presence_of :content_body }
    it { should validate_presence_of :rating }

    context 'rating' do
      it do
        should validate_numericality_of(:rating)
          .is_greater_than_or_equal_to(1)
          .is_less_than_or_equal_to(5)
      end
    end

    context 'content body' do
      it do
        should validate_length_of(:content_body)
          .is_at_least(50).is_at_most(250)
      end
    end
  end
end
