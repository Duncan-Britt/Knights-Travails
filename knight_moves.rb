class Square
  attr_reader :coordinates
  attr_accessor :pointers

  def initialize(coordinates)
    @coordinates = coordinates
    @pointers = []
  end
end

class Knight
  @@BOARD = [
    [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]],
    [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]],
    [[2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7]],
    [[3,0],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7]],
    [[4,0],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7]],
    [[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7]],
    [[6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7]],
    [[7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]
  ]
  def self.board
    @@BOARD
  end
  attr_accessor :current_spot

  def initialize
    @current_spot = build_board
  end

  def build_board(square=@@BOARD[0][0], previous=[])
    a = Square.new(square)
  #  puts "\n#{a.coordinates}\n"
    x = square[0]
    y = square[1]
    if all_pointers_previous?(previous, x, y)
      #puts "here"
      return a
    end
    previous << a
    if x+1 >= 0 && y+2 >= 0 && x+1 <= 7 && y+2 <= 7 && not_previous?(previous, x+1, y+2)
      a.pointers[0] = build_board(@@BOARD[x+1][y+2], previous)
    elsif x+1 >= 0 && y+2 >= 0 && x+1 <= 7 && y+2 <= 7
      a.pointers[0] = get_previous(previous, x+1, y+2)
    end

    if x+2 >= 0 && y+1 >= 0 && x+2 <= 7 && y+1 <= 7 && not_previous?(previous, x+2, y+1)
      a.pointers[1] = build_board(@@BOARD[x+2][y+1], previous)
    elsif x+2 >= 0 && y+1 >=0 && x+2 <= 7 && y+1 <= 7
      a.pointers[1] = get_previous(previous, x+2, y+1)
    end
    # puts "here"
    # puts "x: #{x}, y: #{y}"
    if x+2 >= 0 && y-1 >= 0 && x+2 <= 7 && y-1 <= 7 && not_previous?(previous, x+2, y-1)
      #puts "this spot"
      a.pointers[2] = build_board(@@BOARD[x+2][y-1], previous)
    elsif x+2 >= 0 && y-1 >= 0 && x+2 <= 7 && y-1 <= 7
      a.pointers[2] = get_previous(previous, x+2, y-1)
    end

    if x+1 >= 0 && y-2 >= 0 && x+1 <= 7 && y-2 <= 7 && not_previous?(previous, x+1, y-2)
      a.pointers[3] = build_board(@@BOARD[x+1][y-2], previous)
    elsif x+1 >= 0 && y-2 >= 0 && x+1 <= 7 && y-2 <= 7
      a.pointers[3] = get_previous(previous, x+1, y-2)
    end

    if x-1 >= 0 && y-2 >= 0 && x-1 <= 7 && y-2 <= 7 && not_previous?(previous, x-1, y-2)
      a.pointers[4] = build_board(@@BOARD[x-1][y-2], previous)
    elsif x-1 >= 0 && y-2 && x-1 <= 7 && y-2 <= 7
      a.pointers[4] = get_previous(previous, x-1, y-2)
    end

    if x-2 >= 0 && y-1 >= 0 && x-2 <= 7 && y-1 <= 7 && not_previous?(previous, x-2, y-1)
      a.pointers[5] = build_board(@@BOARD[x-2][y-1], previous)
    elsif x-2 >= 0 && y-1 >= 0 && x-2 <= 7 && y-1 <= 7
      a.pointers[5] = get_previous(previous, x-2, y-1)
    end

    if x-2 >= 0 && y+1 >= 0 && x-2 <= 7 && y+1 <= 7 && not_previous?(previous, x-2, y+1)
      a.pointers[6] = build_board(@@BOARD[x-2][y+1], previous)
    elsif x-2 >= 0 && y+1 >= 0 && x-2 <= 7 && y+1 <= 7
      a.pointers[6] = get_previous(previous, x-2, y+1)
    end

    if x-1 >= 0 && y+2 >= 0 && x-1 <= 7 && y+2 <= 7 && not_previous?(previous, x-1, y+2)
      a.pointers[7] = build_board(@@BOARD[x-1][y+2], previous)
    elsif x-1 >= 0 && y+2 >= 0 && x-1 <= 7 && y+2 <= 7
      a.pointers[7] = get_previous(previous, x-1, y+2)
    end
    #puts "bottom: #{a.coordinates}"
    return a
  end

  def not_previous?(array, x, y)
    bool = array.all? do |e|
      !(e.coordinates[0] == x && e.coordinates[1] == y) # NAND
    end
    bool
  end

  def get_previous(array, x, y)
    node = array.select do |e|
      e.coordinates[0] == x && e.coordinates[1] == y
    end
  end

  def all_pointers_previous?(previous, x, y)
    bool = true
    bool = false if not_previous?(previous, x+1, y+2)
    bool = false if not_previous?(previous, x+2, y+1)
    bool = false if not_previous?(previous, x+2, y-1)
    bool = false if not_previous?(previous, x+1, y-2)
    bool = false if not_previous?(previous, x-1, y-2)
    bool = false if not_previous?(previous, x-2, y-1)
    bool = false if not_previous?(previous, x-2, y+1)
    bool = false if not_previous?(previous, x-1, y+2)
    bool
  end
end

knite = Knight.new
puts knite.current_spot.pointers[1]
