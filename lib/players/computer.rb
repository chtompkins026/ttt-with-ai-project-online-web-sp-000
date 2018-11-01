module Players

  class Computer < Player
    attr_reader :board

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

    def move(board)

      return '4' if board.cells.all?{|e| e == " "}

      WIN_COMBINATIONS.each do |combo|
        if combo.map {|idx| board.cells[idx]}.count(@token) >= 1 && combo.any? {|e| board.cells[e] == " "}
          return combo.select {|idx| board.cells[idx] == " "}.first.to_s
        end
      end

    #   #First Move - Hard Coding This Shizzzz
    #   if board.cells[4] == " "
    #     return "4"
    #   else
    #     return "0"
    #   end
    # end #end of the move board
  end
end
end
