# frozen_string_literal: true

require 'thor'
require 'micro_deploy/version'

module MicroDeploy
  module CLI
    class InitializeGroup < Thor::Group
      include Thor::Actions

      argument :name, type: :string, desc: 'The '

      def create_directory
        empty_directory name unless in_project?
      end

      def setup_gemfile
        create_file project_file('Gemfile') do
          <<~GEMFILE
            source 'https://rubygems.org'

            gem 'micro_deploy', '~> #{MicroDeploy::VERSION}'
          GEMFILE
        end

        system! 'bundle install'
      end

      def setup_configuration
        create_file project_file('environments.yml') do
          <<~YAML
            environment_names:
              production: production
              staging: staging
              testing: testing
          YAML
        end
      end

      private

      def system!(command)
        Dir.chdir project_directory do
          raise 'Could not execute command' unless system command
        end
      end

      def project_file(file_name)
        "#{project_directory}/#{file_name}"
      end

      def project_directory
        @project_directory ||= in_project? ? '.' : "./#{name}"
      end

      def in_project?
        File.basename(Dir.pwd) == name
      end
    end
  end
end
