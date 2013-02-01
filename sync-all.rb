require 'chef/knife'

module KnifePlugin
  class SyncAll < Chef::Knife

    banner "knife sync-all"

    option :environments,
      :short => '-e',
      :long => '--environments',
      :boolean => true,
      :description => "Update only environments"
    option :roles,
      :short => '-r',
      :long => '--roles',
      :boolean => true,
      :description => "Update only roles"
    option :nodes,
      :short => '-n',
      :long => '--nodes',
      :boolean => true,
      :description => "Update only nodes"
    option :databags,
      :short => '-D',
      :long => '--databags',
      :boolean => true,
      :description => "Update only databags"
    option :cookbooks,
      :short => '-c',
      :long => '--cookbooks',
      :boolean => true,
      :description => "Update only cookbooks"
    option :all,
      :short => '-a',
      :long => '--all',
      :boolean => true,
      :description => "Update all roles, environments, nodes, databags and cookbooks"

    deps do
      require 'pathname'
    end

    def run
      if config[:roles] 
        sync_object("roles/*", "role")
      elsif config[:environments]
        sync_object("environments/*", "environment")
      elsif config[:nodes]
        sync_object("nodes/*", "node")
      elsif config[:databags]
        sync_databag("data_bags/*")
      elsif config[:cookbooks]
        sync_cookbooks()
      elsif config[:all]
        sync_object("roles/*", "role")
        sync_object("environments/*", "environment")
        sync_object("nodes/*", "node")
        sync_databag("data_bags/*")
        sync_cookbooks()
      else
        ui.msg("Usage: knife sync-all --help")
      end
    end

    # Upload all cookbooks
    def sync_cookbooks()
      ui.msg("Uploading all cookbooks")
      result = `knife cookbook upload --all`
      ui.msg(result)
    end

    # Upload object based on input
    def sync_object(dir_name,type)
      ui.msg("Finding type #{type} to upload from #{dir_name}")

      files = Dir.glob(dir_name).select { |f| File.file?(f) }
      files.each do |file|
        fname = Pathname.new(file).basename
        if ("#{fname}".end_with?('.json') or "#{fname}".end_with?('.rb'))
            ui.msg("Uploading #{type}: #{fname}")
            result = `knife #{type} from file #{fname}`
        end
      end
    end 

    # Upload databags...
    def sync_databag(dir_name)
      ui.msg("Finding type databag to upload from #{dir_name}")

      dirs = Dir.glob(dir_name).select { |d| File.directory?(d) }

      dirs.each do |dir|
        dirname = Pathname.new(dir).basename

        files = Dir.glob("#{dir}/*").select { |f| File.file?(f) }

        files.each do |file|
          fname = Pathname.new(file).basename
          if ("#{fname}".end_with?('.json') or "#{fname}".end_with?('.rb'))
            ui.msg("Uploading data bag: #{dirname}/#{fname}")
            result = `knife data bag from file #{dirname} #{fname}`
          end 
        end 
      end 
    end

  end
end
