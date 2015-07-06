require_relative 'plugin_template/exporter.rb'


class PlainTextExporter < Exporter
	def self.export(alien_data) 
		output_file = File.open("outputs/#{alien_data.values.first}.txt","w") 
		alien_data.each  do |key,value|
			output_file << "#{key} : #{value}\n"						
		end
		output_file.close
	end

	def self.format_type
		'Plain Text'
	end
end