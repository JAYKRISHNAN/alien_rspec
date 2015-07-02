require_relative 'alien.rb'
require_relative 'alien_data_inputter.rb'
require_relative 'alien_data_exporter.rb'

alien_data = AlienDataInputter.input_data
alien = Alien.new(alien_data)
AlienDataExporter.export_data(alien.attributes)
