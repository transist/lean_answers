require 'spec_helper'

describe Hypothesis do
  let(:hypothesis) { create(:hypothesis) }

  describe '#mark_as_current_after_create' do
    it 'should default to true' do
      expect(hypothesis.mark_as_current_after_create).to eq(true)
    end

    context 'when true' do
      it 'should create hypothesis in current state' do
        hypothesis = create(:hypothesis, mark_as_current_after_create: true)
        expect(hypothesis).to be_current
      end
    end

    context 'when false' do
      it 'should create hypothesis in backlogged state' do
        hypothesis = create(:hypothesis, mark_as_current_after_create: false)
        expect(hypothesis).to be_backlogged
      end
    end

    it 'should not prevent hypotheis transit to current manually' do
      hypothesis = create(:hypothesis, mark_as_current_after_create: false)
      hypothesis.make_current
      expect(hypothesis).to be_current
    end
  end
end
