#frozen_string_literal: true

require 'YAML'

class Square
  attr_reader :coordinates
  attr_accessor :pointers

  def initialize(coordinates)
    @coordinates = coordinates
    @pointers = []
  end
end

class Knight
  @@BOARD = YAML.load_file('./board.yml')

  def self.board
    @@BOARD
  end

  attr_accessor :current_spot

  def initialize
    @current_spot = :a1
  end
end

knite = Knight.new
p Knight.board
