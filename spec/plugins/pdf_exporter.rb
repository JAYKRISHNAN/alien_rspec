require 'prawn'
require_relative 'plugin_template/exporter.rb'

class PdfExporter < Exporter
	def self.export(alien_data) 
		output_file = Prawn::Document.new
		alien_data.each  do |key,value|
			output_file.text("#{key} : #{value}\n")						
		end
		output_file.render_file("#{alien_data.values.first}.pdf") 
	end
end