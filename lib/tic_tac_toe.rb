require_relative "dependencies"
class TicTacToe
  	attr_reader :x_player, :o_player, :board

  	def initialize(n)
  		@board = Board.new(n)
  		@x_player =  Player.new("X")
  		@o_player = Player.new("O")
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

  	#To find next player.
  	def next_of current_player
  		if current_player == self.x_player          
        self.o_player
      else
        self.x_player	
      end
  	end

  	# To play turn.
  	def play(current_player)
  		
  	end

  	private
  		# To select first player.
  		def select_first_player
  			print "Do you want to play first? <y/n>: "
  			ans = gets.chomp
  			if %w[N n].include?(ans)
  	      self.o_player
  	    else
  	      self.x_player
  	    end
  		end

end
