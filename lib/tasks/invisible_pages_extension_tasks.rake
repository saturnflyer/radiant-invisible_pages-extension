namespace :radiant do
  namespace :extensions do
    namespace :invisible_pages do
      
      desc "Runs the migration of the Invisible Pages extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          InvisiblePagesExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          InvisiblePagesExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Invisible Pages to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from InvisiblePagesExtension"
        Dir[InvisiblePagesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(InvisiblePagesExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
