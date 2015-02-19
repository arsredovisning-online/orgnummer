require 'spec_helper'
require 'orgnummer'


describe Orgnummer do
  describe 'initialize' do
    it 'can be intialized with (almost) anything' do
      expect { Orgnummer.new(900101) }.not_to raise_error
      expect { Orgnummer.new(nil) }.not_to raise_error
      expect { Orgnummer.new('abs') }.not_to raise_error
    end
  end

  describe 'behavior' do

    let(:short) { Orgnummer.new(12) }
    let(:short_s) { Orgnummer.new('12') }
    let(:bad_end) { Orgnummer.new(5568610828) }

    let(:ab) { Orgnummer.new(5568610827) }
    let(:ab_s) { Orgnummer.new('5568610827') }
    let(:ab_s_with_hyphen) { Orgnummer.new('556861-0827') }


    describe 'validate' do

      it 'validates false for malformed numbers' do
        expect(short.valid?).to be false
        expect(short_s.valid?).to be false
        expect(bad_end.valid?).to be false
      end

      it 'validates true for correct numbers' do
        expect(ab.valid?).to be true
        expect(ab_s.valid?).to be true
        expect(ab_s_with_hyphen.valid?).to be true
      end
    end

    describe 'to string' do
      it 'adds the hyphen' do
        expect(ab.to_s).to eq '556861-0827'
        expect(ab_s.to_s).to eq '556861-0827'
      end

      it 'gives a hint of validity' do
        expect(short.to_s).to eq 'Not a valid number: 12'
      end
    end
  end
end