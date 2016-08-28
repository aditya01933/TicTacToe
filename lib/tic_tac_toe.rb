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
  		self.board.size.each do 
  			play(current_player)
  			current_player = next_of current_player 
      end
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
	  		puts "Where do want to move? <1-#{self.board.size}>: "
	  		position = gets.chomp
	  		if valid? position
	  			self.player.move board
	  			break
	  		end
	  	end
  	end

  	private
  		def valid? position
  			if [1..(self.board.size)].include? position
  				puts "\nInvalid input, Please choose number between 1 to 9\n"
  				return false
  			elsif %w{X O}.include? board.grid[position]	
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
