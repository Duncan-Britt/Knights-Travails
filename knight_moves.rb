# frozen_string_literal: true

require 'YAML'

KNIGHT_MOVES = YAML.load_file('./knight_moves.yml')
CHESS_BOARD = YAML.load_file('./chess_board.yml')

def print_knight_hash
  KNIGHT_MOVES.each { |k, v| puts ":#{k} => #{v}" }
end

def print_chess_board
  i = CHESS_BOARD.length - 1
  until i == -1
    j = i - 7
    a = []
    until j == i
      a << CHESS_BOARD[j]
      j += 1
    end
    puts a.join('  ')
    i -= 8
  end
  p CHESS_BOARD
end

def valid_spot?(spot)
  CHESS_BOARD.include?(spot)
end

def validate_spots?(start, finish)
  unless valid_spot?(start) && valid_spot?(finish)
    puts "Invalid parameters. Use a symbol, :a1 - :h8."
    return false
  end
  true
end

def level_order(current_spot, desired_spot, queue=[current_spot], steps=[current_spot])
  if current_spot == desired_spot
    p steps
    return
  end

  next_spot_to_check = queue.shift
  
  KNIGHT_MOVES[current_spot].each { |ref| queue << ref }
  level_order(next_spot_to_check, desired_spot, queue, steps)
end

def print_knight_moves(start, finish)
  return unless validate_spots?(start, finish)
  level_order(start, finish)
end

# print_knight_hash
# print_chess_board

print_knight_moves(:a1, :h8)
