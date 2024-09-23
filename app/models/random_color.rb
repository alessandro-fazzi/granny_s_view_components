class RandomColor
  def initialize(hex: nil)
    @hex = hex ||= SecureRandom.hex(3)
  end

  def css_color
    "##{@hex}"
  end

  def to_s
    css_color
  end
end
