#encoding: utf-8

class Orgnummer
  attr_reader :number

  def initialize(number)
    @number = number.to_s
    if !@number.nil? && !@number.empty?
      # hyphen is ok, but remove it to pass validation algorithm
      @number = @number.gsub(/-/, '')
      # strip, we are kind and helpful
      @number = @number.strip
    end
  end

  def valid?
    valid = false

    if !@number.nil? && !@number.empty?

      if (@number =~/\A\d{10}\z/) == 0
        multiplier = 2
        sum = 0

        @number[0...9].each_char do |n|
          part = (n.to_i * multiplier).to_s
          sum += part.length == 1 ? part.to_i : part[0].to_i + part[1].to_i
          multiplier = multiplier == 1 ? 2 : 1
        end

        checksum = (10 - sum.modulo(10)).modulo(10)

        valid = checksum == @number[-1, 1].to_i
      end
    end
    valid
  end

  def to_s
    self.valid? ? @number[0..5] + '-' + @number[6..10] : "Not a valid number: #{@number}"
  end

  def type_of_organization
    valid? ? get_type_from_first_char : :odefinierat
  end

  def eql?(orgnummer)
    self.class.equal?(orgnummer.class) &&
        number == orgnummer.number
  end

  alias == eql?

  def hash
    number.hash
  end

  private

  def get_type_from_first_char
    case @number[0, 1]
      when '1'
        :dodsbo
      when '2'
        :stat_landsting_kommun_forsamling
      when '3'
        :utlandskt_foretag
      when '5'
        :aktiebolag
      when '6'
        :enkelt_bolag
      when '7'
        :ekonomisk_forening
      when '8'
        :ideell_forening_stiftelse
      when '9'
        :handels_kommanditbolag
      else
        :odefinierat
    end
  end

end
