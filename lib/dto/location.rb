module DTO
  class Location
    attr_reader :x, :y

    def initialize(location_data)
      @x = location_data['x'].to_i
      @y = location_data['y'].to_i
    end
  end
end
