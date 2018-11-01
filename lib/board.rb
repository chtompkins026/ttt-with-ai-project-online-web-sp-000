require 'pry'

class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(pos)
    index = input_to_index(pos)
    self.cells[index]
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      count += 1 if cell == 'X' || cell == 'O'
    end
    count
  end

  def taken?(num)
    number = num.to_i
    check_pos = self.position(number)
    return false if check_pos == " " || check_pos == nil
    return true
  end

  def valid_move?(position)
      check = position.to_i
      check.between?(1,9) && !taken?(check)
    end

  def full?
    self.cells.all? {|cell| cell != " "}
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end


end #end of the Board class