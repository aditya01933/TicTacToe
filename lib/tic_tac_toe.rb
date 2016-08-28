require_relative "dependencies"
class TicTacToe
  	attr_reader :player, :robot, :board

  	def initialize(n)
  		@board = Board.new(n)
  	end

  	# To start the game.
  	def start
  		self.board.display_instruction
  		current_player = select_first_player
  		(self.board.size).times do 
  			play(current_player)
  			current_player = next_of current_player 
      end
      display_winner(nil, true)
  	end

  	# To play turn.
  	def play(current_player)
  		if current_player == player
  			players_move
  		else
  			robots_move
  		end
  	end

  	#To find next player.
  	def next_of current_player
  		if current_player == self.player          
        self.robot
      else
        self.player	
      end
  	end

  	#player's move
  	def players_move
	  	loop do 	  		
	  		position = gets.chomp
	  		if valid? position  		
	  			self.player.move board, position, self
	  			break
	  		end
	  	end
  	end

  	#Robot's move
  	def robots_move
  		robot.best_move self.board, self
  	end

  	def check_winner(board)
  	  x_count = 0
  	  o_count = 0
  	  board.winning_places.each do |winning_place|
  	    winning_place.each do |index|
  	      if board.position_with_value["#{index}"] == "X"
  	        x_count = x_count + 1
  	      elsif board.position_with_value["#{index}"] == "O"
  	        o_count = o_count + 1
  	      end
  	    end
  	    if x_count == 3 or o_count == 3
  	      break
  	    else
  	      x_count = 0
  	      o_count = 0
  	    end
  	  end
  	  if x_count == 3
  	    return "X won"
  	  elsif o_count == 3
  	    return "O won"
  	  end
  	  return "No One"
  	end

  	def display_winner(symbol, draw = false)
  	    puts "\n*************| Result |*************"
  	    if symbol == "X"
  	      puts "X-won the game\n\n"
  	    elsif draw == true
  	      puts "game is draw\n\n"	  
  	    else
  	      puts "O-won the game \n\n"
  	    end
  	    exit
  	  end

  	private
  		def valid? position
  			p [1..(self.board.size)]
  			p %w{X, x, o, O}
  			if [1..(self.board.size)].include? position
  				puts "\nInvalid input, Please choose number between 1 to 9\n"
  				return false
  			elsif %w{X, x, o, O}.include? board.position_with_value[position]	
  				puts "\nPosition already occupied, Please choose another number...\n"
  				return false
  			end
  			return true
  		end

  		# To select first player.
  		def select_first_player
  			print "Do you want to play first? <y/n>: "
  			ans = gets.chomp
  			if %w[Y y].include?(ans)
  	      @robot = Player.new("X")
  	      @player =  Player.new("O")
  	    else
  	    	@player =  Player.new("X")
  	      @robot = Player.new("O")
  	    end
  		end

end

TicTacToe.new(3).start