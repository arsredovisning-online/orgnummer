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
    let(:ba) { Orgnummer.new(5568610828) }
    let(:ab_s) { Orgnummer.new('5568610827') }
    let(:ab_s_with_hyphen) { Orgnummer.new('556861-0827') }
    let(:ab_s_with_spaces) { Orgnummer.new('  556861-0827   ') }


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
        expect(ab_s_with_spaces.valid?).to be true
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

    describe 'equals and hash code' do
      it 'behaves as expected for equals and variants' do
        expect(ab).to eq ab
        expect(ab).to eql ab
        expect(ab).to equal ab
        expect(ab).to_not equal ab_s
        expect(ab).to eq ab_s
        expect(ab_s).to eq ab
        expect(ab_s).to_not eq ba

      end

      it 'behaves as expected for hash code' do
        expect(ab.hash).to eq ab.hash
        expect(ab.hash).to equal ab_s.hash
        expect(ab.hash).to_not eq ba.hash
      end
    end

    describe 'type of organization' do
      it 'resolves type of organization based on number' do
        expect(ab.type_of_organization).to eq :aktiebolag
        expect(bad_end.type_of_organization).to eq :odefinierat
        expect(Orgnummer.new(1568610826).type_of_organization).to eq :dodsbo
        expect(Orgnummer.new(2568610824).type_of_organization).to eq :stat_landsting_kommun_forsamling
        expect(Orgnummer.new(3568610822).type_of_organization).to eq :utlandskt_foretag
        expect(Orgnummer.new(6568610825).type_of_organization).to eq :enkelt_bolag
        expect(Orgnummer.new(7568610823).type_of_organization).to eq :ekonomisk_forening
        expect(Orgnummer.new(8568610821).type_of_organization).to eq :ideell_forening_stiftelse
        expect(Orgnummer.new(9568610829).type_of_organization).to eq :handels_kommanditbolag
      end
    end
  end
end