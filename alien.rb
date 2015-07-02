class Alien

	def initialize(alien_data)
		alien_data.each do |key,value|
			self.instance_variable_set('@'+key.downcase.tr(' ','_') ,value)
		end
	end

	def self.properties
		return ['Code Name','Blood Colour','Number Of Antennas','Number Of legs','Home Planet']
	end
	

	def attributes
		attributes = {}
		instance_variables_enum = self.instance_variables.to_enum
		Alien.properties.each do |property|
			attributes[property] = self.instance_variable_get(instance_variables_enum.next)
		end
		return attributes
	end


end