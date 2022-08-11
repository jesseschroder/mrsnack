module DTO
  class Snake
    attr_reader :id, :name, :health, :body, :latency, :head, :length, :shout, :squad, :customizations

    def initialize(snake_request_data)
      @id = snake_request_data['id']
      @name = snake_request_data['name']
      @health = snake_request_data['health']
      @body = build_locations(snake_request_data['body'])
      @latency = snake_request_data['latency']
      @head = build_location(snake_request_data['head'])
      @length = snake_request_data['length']
      @shout = snake_request_data['shout']
      @squad = snake_request_data['squad']
      @customizations = snake_request_data['customizations']
    end

    private

    def build_locations(locations_data)
      locations_data.map { |location| build_location(location) }
    end

    def build_location(location_data)
      DTO::Location.new(location_data)
    end
  end
end
