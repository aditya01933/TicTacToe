class Player
	attr_accessor :symbol # Symbol - 'O' or 'X'

	def initialize(symbol)
		@symbol = symbol
	end

	def move board, position
		board.grid[position] = self.symbol
	end
	
end