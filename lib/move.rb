# frozen_string_literal: true

class Move
  def initialize(game:, turn:, board:, me:)
    @game = game
    @turn = turn
    @board = board
    @me = me
  end

  def execute
    {
      move: 'up',
    }
  end
end
