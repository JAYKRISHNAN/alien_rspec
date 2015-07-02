require 'rspec'
require_relative '../alien.rb'
require_relative '../alien_data_inputter.rb'
require_relative '../alien_problem.rb'
require_relative '../alien_data_exporter.rb'
require_relative '../plugins/plugin_template/exporter.rb'
require_relative '../plugins/pdf_exporter.rb'







describe 'alien' do

	describe 'initialize' do

		it 'creates an instance of alien' do 
			alien_data = {'Code Name' => 'Jack','Blood Colour' => 'Blue','Number Of Antennas' => 2,'Number Of legs' => 3,'Home Planet' => 'Pluto'}
			alien = Alien.new(alien_data)
			expect(alien).to be_an_instance_of Alien
		end


		alien_data = {'Code Name' => 'Jack','Blood Colour' => 'Blue','Number Of Antennas' => 2,'Number Of legs' => 3,'Home Planet' => 'Pluto'}
		alien = Alien.new(alien_data)
		instance_variables_enum = alien.instance_variables.to_enum
		alien_data.each do |key,value|
			it "sets the value of its instance variable #{'@' + key.downcase.tr(' ','_')}" do
				expect(alien.instance_variable_get(instance_variables_enum.next)).to eql value
			end
		end
	end

	it 'has certian properties' do
		expect(Alien.properties).to eql ['Code Name','Blood Colour','Number Of Antennas','Number Of legs','Home Planet']
	end



	it 'returns its attributes' do
		alien_data = {'Code Name' => 'Jack','Blood Colour' => 'Blue','Number Of Antennas' => 2,'Number Of legs' => 3,'Home Planet' => 'Pluto'}
		alien = Alien.new(alien_data)
		expect(alien.attributes).to eql ({'Code Name' => 'Jack','Blood Colour' => 'Blue','Number Of Antennas' => 2,'Number Of legs' => 3,'Home Planet' => 'Pluto'})
	end
end







describe 'alien data Exporter' do

	describe 'fetch plugins' do
		it 'fetches all plugins in plugins folder as array' do
			expect(AlienDataExporter.fetch_plugins('/home/joker/alien_rspec/spec/dummy_plugins1/')).to eql ['plain_text_exporter.rb','pdf_exporter.rb']
		end
		it 'returns empty array if invoked with a path to empty directory'do
			expect(AlienDataExporter.fetch_plugins('/home/joker/alien_rspec/spec/dummy_plugins2/')).to eql []
		end
	end


	it 'displays all available formats'
	it 'inputs user choice'
	it 'imports chosen module'

	it 'gets name of class from file name' do
		expect(AlienDataExporter.get_class_name('csv_exporter.rb')).to eql 'CsvExporter' 
	end


end





describe 'exporter' do
	it 'has a method export' do
		expect(Exporter).to respond_to(:export)
	end
end


describe 'pdf exporter' do
	it 'exports to pdf format'
end


describe 'plain text exporter' do
	it 'exports to plain text format'
end



