class Player
	attr_accessor :symbol 

	def initialize(symbol)
		@symbol = symbol
	end

	def move board, position, engine

		board.position_with_value["#{position}"] = self.symbol
		board.display
		winner = engine.check_winner(board)
		if winner != "No One"
		  engine.display_winner(self.symbol)
		end
	end

	def best_move(board, engine) 
	  position = check_priority(board)
	  board.position_with_value["#{position}"] = self.symbol
	  winner = engine.check_winner(board)

	  if winner != "No One"
	    puts ""
	    board.display
	    engine.display_winner(self.symbol)
	  end
	  puts ""
	  board.display
	end

	private

	def check_priority(board) 
	  flag = true

	  x_mark = "X"
	  o_mark = "O"

	  o_position = position_priority(board, o_mark)

	  if !o_position.nil?
	    return o_position
	  end

	  x_position = position_priority(board, x_mark)

	  if !x_position.nil?
	    return x_position
	  end

	  while flag do
	    random_position = 1 + rand(8)
	    if board.position_with_value["#{random_position}"] != "X" and board.position_with_value["#{random_position}"] != "O"
	      board.position_with_value["#{random_position}"] = "O"
	      return random_position
	      flag false
	    end
	  end
	end

	def position_priority(board, mark)
	  board.winning_places.each do |winning_place|
	    priority_positions_order = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]
	    priority_positions_order.each do |priority|
	      if (board.position_with_value["#{winning_place[priority[0]]}"] == mark) and (board.position_with_value["#{winning_place[priority[1]]}"] == mark)
	        if board.position_with_value["#{winning_place[priority[2]]}"] == " "
	          return winning_place[priority[2]]
	        end
	      end
	    end
	  end
	  return nil
	end



	
	
end