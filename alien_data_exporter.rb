
class AlienDataExporter

	def self.fetch_plugins(path)
		(Dir.entries(path).select { |entry|  !File.directory?(entry)})
	end

	def AlienDataExporter.import_plugins(plugins) 
		plugins.each do |plugin| 													  
			require_relative 'plugins/'+ plugin
		end
	end


    def  self.display_formats(plugins) 
		plugins.each_with_index do |plugin,index|
			class_name = AlienDataExporter.get_class_name("plugins/#{plugin}")
			puts "#{index+1}.  " + ((Object.const_get(class_name)).format_type)
		end
	end


	def self.choose_format(plugins)
		puts 'Choose format : '
		AlienDataExporter.display_formats(plugins) 
		puts 'Enter Choice : '
		choice = STDIN.gets.chomp.to_i
		choice
	end

	

	def self.get_class_name(path_to_plugin_file)
		IO.read(path_to_plugin_file).scan(/\bclass.\K\S+/).first
	end

	def self.export_data(alien_data)
		plugins = (AlienDataExporter.fetch_plugins('plugins/'))[0..-2]
		AlienDataExporter.import_plugins(plugins)
		choice = AlienDataExporter.choose_format(plugins)   
		class_name = AlienDataExporter.get_class_name("plugins/#{plugins[choice-1]}")
		exporting_class = Object.const_get(class_name)
		exporting_class.export(alien_data)
	end	
end


