require 'thor'

module MicroDeploy
  class CLI < Thor
    desc 'up SERVICE [environment]', 'Starts a new webservice'
    long_desc <<-LONGDESC.chomp
      `micro_deploy up [service] [environment]` Start a new webservice called `service` using the specified environment
      The environment is inferred from it's folder location
    LONGDESC
    def up(service, environment='master')
      puts "I am #{service} #{environment}"
    end

    desc 'down SERVICE [environment]', 'Starts a new webservice'
    long_desc <<-LONGDESC.chomp
      `micro_deploy down [service] [environment]` Start a new webservice called `service` using the specified environment
      The environment is inferred from it's folder location
    LONGDESC
    def down(service, environment='master')
      puts "I am #{service} #{environment}"
    end
  end
end
