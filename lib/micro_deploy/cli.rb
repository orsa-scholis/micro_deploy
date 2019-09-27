# frozen_string_literal: true

require 'thor'

module MicroDeploy
  class CLI < Thor
    desc 'up SERVICE [environment]', 'Starts a new webservice'
    long_desc <<-LONGDESC.chomp
      `micro_deploy up [service] [environment]` Start a new webservice called `service` using the specified environment
      The environment is inferred from it's folder location
    LONGDESC
    def up(service, environment = 'master')
      puts "I am #{service} #{environment}"
    end

    desc 'down SERVICE [environment]', 'Stops a new webservice'
    long_desc <<-LONGDESC.chomp
      `micro_deploy down [service] [environment]` Stops a new webservice called `service` using the specified environment
    LONGDESC
    def down(service, environment = 'master')
      puts "I am drowning #{service} #{environment}"
    end

    desc 'restart SERVICE [environment]', 'Restarts a new webservice'
    long_desc <<-LONGDESC.chomp
      `micro_deploy restart [service] [environment]` Restarts a new webservice called `service` using the specified environment
    LONGDESC
    def restart(service, environment = 'master')
      puts "I am drowning and rescuing again #{service} #{environment}"
    end

    desc 'init', 'Creates a scaffold directory structure'
    def init
      create_file 'testing'
    end
  end
end
