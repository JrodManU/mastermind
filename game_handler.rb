class Game

	require_relative "code_handler"

	def initialize
		@code_handler = CodeHandler.new
		start
	end

	def start
		3.times { puts "" }
		puts "Your goal is to guess the 4 letter code with the letters 'A-F'."
		puts "'R' means you have 1 letter in the correct position."
		puts "'W' means you are using a letter in the secrect code; just in the wrong position."
		puts ""
		puts "Alright, start guessing!"
		loop do
			guess = gets.chomp
			until @code_handler.good_code(guess)
				puts "Please give a valid code."
				guess = gets.chomp
			end
			rating = @code_handler.rate(guess)
			break if rating == "RRRR"
			puts "Rating: #{rating}"
			puts ""
			puts "Try again."
		end
		puts "You won!"
	end

end

game = Game.new