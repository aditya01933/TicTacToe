class Board
	attr_accessor :size, :position_with_value

	def initialize(n)
		@size = n*n
		@position_with_value = grid
	end

	def display_instruction

		puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
		# position_with_value.each do |cell|
		# 	print "| #{cell[0]} " 
		# 	if (cell[0]%3) == 0
		# 		print "|"
		# 		puts "\n-----------------"
		# 	end
		# end
		# puts
	end

	def display
	    puts ""
	    puts " #{self.position_with_value["1"]} | #{self.position_with_value["2"]} | #{self.position_with_value["3"]} "
	    puts "-----------"
	    puts " #{self.position_with_value["4"]} | #{self.position_with_value["5"]} | #{self.position_with_value["6"]} "
	    puts "-----------"
	    puts " #{self.position_with_value["7"]} | #{self.position_with_value["8"]} | #{self.position_with_value["9"]} "
	    puts ""
	  end

	# Winning Places
	def winning_places
		case self.size
		when 9
		 [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
		when 16
		 # [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
		when 25
		 # 	
		end
	end

	# Create a grid(board) hash.
	def grid
		# def self.position_with_value
		# 	@positions
		# end
		positions = {}
		1.upto(self.size) do |n|
			positions["#{n}"] = " "
		end
		positions
	end


end
