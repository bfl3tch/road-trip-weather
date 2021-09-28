class Backgrounds
  attr_reader :id,
              :image,
              :location

  def initialize(info, location)
    @id = nil
    @image = info[:results]
    @location = "#{location}"
  end
end
