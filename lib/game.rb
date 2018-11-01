class Game
attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end

  def board
    @board
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
   WIN_COMBINATIONS.each do |win_combo|
     pos1 = win_combo[0]
     pos2 = win_combo[1]
     pos3 = win_combo[2]

     position_1 = board.cells[pos1]
     position_2 = board.cells[pos2]
     position_3 = board.cells[pos3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combo
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combo
     end
   end
   return false
 end

 def draw?
   if !won? && board.full?
     return true
   end
 end

 def over?
   return true if won? || draw?
 end

 def check_win_combination?(player, win_combo)
      win_combo.all? do |position|
      board.cells[position] == player
    end
  end

  def winner
    if !won?
      return nil
    else WIN_COMBINATIONS.each do |win_combo|
      if check_win_combination?('X', win_combo)
        return 'X'
      elsif check_win_combination?('O', win_combo)
        return 'O'
      end
      end
    end
  end

  def turn
    puts "Player #{current_player.token}'s turn!"
    puts "Pick a move from (1-9):"
    board.display

    user_input = current_player.move(board)

    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "\n"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "\n"
      puts "Cat's Game!"
    end
    board.display
  end



end