require_relative 'alien.rb'

class AlienDataExporter

	def self.fetch_plugins(absolute_path)
		return (Dir.entries(absolute_path).select { |entry|  !File.directory?(entry)})
	end

    def  self.display_formats(plugins) 
		plugins.each_with_index do |plugin,index|
			puts "#{index+1}.#{plugin.capitalize.tr('_',' ').slice(0..-13)}"
		end
	end


	def self.choose_format(plugins)
		puts 'Choose format : '
		AlienDataExporter.display_formats(plugins) 
		puts 'Enter Choice : '
		choice = STDIN.gets.chomp.to_i
		return choice
	end

	def self.import_plugin(plugin_file_name)
		require_relative 'plugins/' + plugin_file_name
	end

	def self.get_class_name(plugin_file_name)
		class_name = ''
		plugin_file_name.slice(0..-4).split('_').each{|x| class_name << x.capitalize}
		return class_name
	end

	def self.export_data(alien_data)

		plugins = (AlienDataExporter.fetch_plugins('/home/joker/alien_rspec/plugins/'))[0..-2]
		choice = AlienDataExporter.choose_format(plugins)   
		AlienDataExporter.import_plugin(plugins[choice-1])
		class_name = AlienDataExporter.get_class_name(plugins[choice-1])
		exporting_class = Object.const_get(class_name)
		exporting_class.export(alien_data)
	end	
end


