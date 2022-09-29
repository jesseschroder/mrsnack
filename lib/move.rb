# frozen_string_literal: true

class Move
  def initialize(game:, turn:, board:, me:)
    @game = game
    @turn = turn
    @board = board
    @me = me
  end

  def execute
    # No point in ranking if there's one or less options available
    return no_moves if valid_moves.empty?
    return direction(valid_moves.first) if valid_moves.count == 1

    move = rank_movement_options
    direction(move)
  end

  private

  def move_valid?(x:, y:)
    # Not valid if moving off the board
    return false if x.negative? || y.negative?
    return false if x == @board.width || y == @board.height # board has 0x0 so equal to dimensions is outside board

    # Not valid if a snake is in the way!
    return false if snake_collision?(x, y)

    true
  end

  def rank_movement_options
    # for now just move randomly
    valid_moves.sample
  end

  def base_moves
    [
      DTO::Location.new({ 'x' => @me.head.x - 1, 'y' => @me.head.y }),
      DTO::Location.new({ 'x' => @me.head.x + 1, 'y' => @me.head.y }),
      DTO::Location.new({ 'x' => @me.head.x, 'y' => @me.head.y - 1 }),
      DTO::Location.new({ 'x' => @me.head.x, 'y' => @me.head.y + 1 }),
    ]
  end

  def valid_moves
    # There are 4 possible moves (up, down, left right)
    # Filter out any that are not valid (outside board, into another snake)
    @valid_moves ||= base_moves.select { |move| move_valid?(x: move.x, y: move.y) }
  end

  def snake_bods
    @snake_bods ||= @board.snakes.flat_map(&:body)
  end

  def snake_collision?(x, y)
    snake_bods.each do |body_piece|
      return true if x == body_piece.x && y == body_piece.y
    end
    false
  end

  def direction(location)
    x_movement = @me.head.x - location.x
    y_movement = @me.head.y - location.y

    if x_movement.zero?
      return y_movement.positive? ? "down" : "up"
    else
      return x_movement.positive? ? "left" : "right"
    end
  end

  def no_moves
    puts "--------------------NO VALID MOVES------------------------"
    'up'
  end
end
