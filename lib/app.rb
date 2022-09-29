# frozen_string_literal: true

require 'pry'

class App
  SETTINGS = {
    apiversion: '1',
    author: 'jesseschroder',
    color: '#191970',
    head: '',
    tail: '',
    version: '0.0.1-beta',
  }

  def initialize(request_data = {})
    @request_data = request_data
  end

  def self.settings
    SETTINGS
  end

  def move
    move_result = Move.new(
      game: game_data,
      turn: turn,
      board: board_data,
      me: me,
    ).execute

    {
      move: move_result
    }
  end

  private

  def game_data
    DTO::Game.new(@request_data['game'])
  end

  def turn
    @request_data['turn']
  end

  def board_data
    DTO::Board.new(@request_data['board'])
  end

  def me
    DTO::Snake.new(@request_data['you'])
  end
end
