module DTO
  class Board
    attr_reader :height, :width, :food, :hazards, :snakes

    def initialize(board_request_data)
      @height = board_request_data['height']
      @width = board_request_data['width']
      @food = build_locations(board_request_data['food'])
      @hazards = build_locations(board_request_data['hazards'])
      @snakes = build_snakes(board_request_data['snakes'])
    end

    private

    def build_snakes(snakes_request_data)
      snakes_request_data.map { |snake| }
    end

    def build_locations(locations_data)
      locations_data.map { |location| DTO::Location.new(location) }
    end
  end
end
