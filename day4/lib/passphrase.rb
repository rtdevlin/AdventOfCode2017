class Passphrase
  attr_reader :passphrase
  def initialize(passphrase)
    @passphrase = passphrase
  end

  def valid?
    words = passphrase.split(' ')
    unique_words = words.uniq
    words.size == unique_words.size
  end

  def super_valid?
    return false unless valid?
    words = passphrase.split(' ')
    rearranged_words = words.map{|word| word.split('').sort.join('')}
    self.class.new(rearranged_words.join(' ')).valid?
  end
end
