module Players
  class Computer < Player
    attr_reader :board

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    def move(board)
      @board = board

      opponent_token

      if good_move(self.token) != nil
        number = good_move(self.token)
      elsif good_move(opponent_token) != nil
        number = good_move(opponent_token)
      else
        number = free_move
      end
      number += 1
      return number.to_s
    end

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

    def good_move(token)
        winning_move = nil

        WIN_COMBINATIONS.detect do |win_combo|
           winning_move = win_combo.detect { |e| board.cells[e] == " " }
          if winning_move && win_combo.count{ |e| board.cells[e] == token } >= 2
            return winning_move
          end
        end

        winning_move
      end

    def free_move
      board.cells[4] == " " ? 4 : board.cells.index {|index| index == " "}
    end


  end #end of module

end #end of Class

