# frozen_string_literal: true

require 'thor'

module MicroDeploy
  module CLI
    class InitializeGroup < Thor::Group
      include Thor::Actions

      def create_directory
        puts 'creating directory'
      end
    end
  end
end
