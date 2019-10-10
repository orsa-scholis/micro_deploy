# frozen_string_literal: true

require 'thor'
require 'micro_deploy/cli'
require 'micro_deploy/cli/initialize_group'
require 'micro_deploy/cli/project_generate_group'
require 'active_support/core_ext'

module MicroDeploy
  module CLI
    # As approved by @TheFehr, the class is called MissionControl
    class MissionControl < Thor
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

      register MicroDeploy::CLI::InitializeGroup, 'init', 'init NAME', 'Creates a scaffold directory structure'
      register MicroDeploy::CLI::ProjectGenerateGroup, 'generate', 'generate NAME', 'Generates a new project'
    end
  end
end
