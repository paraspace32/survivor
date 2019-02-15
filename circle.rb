class Circle
  attr_accessor :group

  def initialize
    @group = []
  end

  def next_left(data, index=0)
    index.nil? ? nil : data.unshift(data.pop)[index]
  end
end