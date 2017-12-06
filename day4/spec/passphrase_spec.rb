require File.expand_path("../../lib/passphrase.rb", __FILE__)
require 'pry'

describe Passphrase do
  context '#valid?' do
    let(:good_phrase) {Passphrase.new 'aa bb cc dd ee'}
    let(:bad_phrase) {Passphrase.new 'aa bb cc dd aa'}

    it 'will return true if passphrase do not contain duplicate words' do
      expect(good_phrase.valid?).to be true
    end

    it 'will return false if passphrase does contain duplicate words' do
      expect(bad_phrase.valid?).to be false
    end
  end

  context '#super_valid?' do
    let(:good_phrase) {Passphrase.new 'abcde fghij'}
    let(:bad_phrase) {Passphrase.new 'abcde xyz ecdab'}
    let(:gooder_phrase) {Passphrase.new 'a ab abc abd abf adj'}
    let(:bestest_phrase) {Passphrase.new 'iiii oiii ooii oooi oooo'}
    let(:worstest_phrase) {Passphrase.new 'oiii ioii iioi iiio'}

    it 'will return true if passphrase do not contain duplicate words' do
      expect(good_phrase.super_valid?).to be true
      expect(gooder_phrase.super_valid?).to be true
      expect(bestest_phrase.super_valid?).to be true
    end

    it 'will return false if passphrase does contain duplicate words' do
      expect(bad_phrase.super_valid?).to be false
      expect(worstest_phrase.super_valid?).to be false
    end
  end
end
