class Board
	attr_accessor :size

	def initialize(n)
		@size = n
	end

	def display_instruction
		position_with_value.each do |cell|
			print "| #{cell[0]} " 
			if (cell[0]%self.size) == 0
				print "|"
				puts "\n-----------------"
			end
		end
		puts
	end

	# Winning Places
	def winning_places
		case self.size
		when 3
		 [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
		when 4
		 # [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
		when 5
		 # 	
		end
	end

	# Create a grid(board) hash.
	def position_with_value
		positions = {}
		1.upto(self.size*self.size) do |n|
			positions[n] = " "
		end
		positions
	end

end
