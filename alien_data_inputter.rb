require_relative 'alien.rb'

class AlienDataInputter
	def self.input_data
		alien_data = {}
		Alien.properties.each do |property|
			puts "Enter #{property} : "
			alien_data[property]= STDIN.gets.chomp
		end
		return alien_data	
	end
end