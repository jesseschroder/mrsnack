# frozen_string_literal: true

module DTO
  class Game
    attr_reader :id, :ruleset, :map, :timeout, :source

    def initialize(game_request_data)
      @id = game_request_data['id']
      @ruleset = game_request_data['ruleset']
      @map = game_request_data['map']
      @timeout = game_request_data['timeout']
      @source = game_request_data['source']
    end
  end
end
