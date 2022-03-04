require 'rails_helper'

RSpec.describe HiddenWord do
  describe 'feedback' do
    subject {HiddenWord.new(secret).feedback(guess)}

    context 'with hidden word mourn' do
      let(:secret) {'mourn'}

      context 'guess juicy' do
        let(:guess) {'juicy'}

        it 'reports u in wrong position' do
          is_expected.to eq [HiddenWord::NONE, HiddenWord::ALMOST, HiddenWord::NONE, HiddenWord::NONE, HiddenWord::NONE]
        end
      end

      context 'guess orate' do
        let(:guess) {'orate'}
        it 'reports o and r in wrong position' do
          is_expected.to eq [HiddenWord::ALMOST, HiddenWord::ALMOST, HiddenWord::NONE, HiddenWord::NONE, HiddenWord::NONE]
        end
      end
    end

    context 'when hidden word is cheap' do
      let(:secret) {'cheap'}



      context 'guess juicy' do
        let(:guess) {'juicy'}
        it 'reports c in wrong position' do
          is_expected.to eq [HiddenWord::NONE, HiddenWord::NONE, HiddenWord::NONE, HiddenWord::ALMOST, HiddenWord::NONE]
        end
      end

      context 'guess orate' do
        let(:guess) {'orate'}
        it 'reports a and e in the wrong position' do
          is_expected.to eq [HiddenWord::NONE, HiddenWord::NONE, HiddenWord::ALMOST, HiddenWord::NONE, HiddenWord::ALMOST]
        end
      end

      context 'shuffle of orate' do
        def string_shuffle(input)
          input.chars.shuffle.join
        end

        let(:guess) {string_shuffle('orate')}

        it 'reports 3 none' do
          nones = subject.to_a.select { |x| x == HiddenWord::NONE }
          expect(nones.count).to eq 3
          expect(subject.length).to eq 5
        end
      end
    end
  end
end
