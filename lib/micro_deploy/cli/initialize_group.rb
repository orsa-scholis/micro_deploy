# frozen_string_literal: true

require 'thor'
require 'micro_deploy/version'

module MicroDeploy
  module CLI
    class InitializeGroup < Thor::Group
      PRE_RECEIVE_HOOK_TEMPLATE_PATH = 'hooks/pre-receive'

      include Thor::Actions

      argument :name, type: :string, desc: 'The name of the project group'

      def self.source_root
        File.expand_path('templates', __dir__)
      end

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

        system! 'bundle install', 'Running bundle install'
      end

      def setup_configuration
        create_file project_file(CONFIGURATION_FILE_NAME) do
          <<~YAML
            ---
            micro_deploy:
              environment_names:
                production: production
                staging: staging
                testing: testing
              docker:
                image_prefix:
          YAML
        end
      end

      def install_hooks
        template PRE_RECEIVE_HOOK_TEMPLATE_PATH, project_file('/hooks/pre-receive')
      end

      private

      def system!(command, description = nil)
        Dir.chdir project_home do
          puts description if description.present?
          raise 'Could not execute command' unless system command
        end
      end

      def project_file(file_name)
        "#{project_home}/#{file_name}"
      end

      def project_directory(directory_name)
        "#{project_home}/#{directory_name}"
      end

      def project_home
        @project_directory ||= in_project? ? '.' : "./#{name}"
      end

      def in_project?
        File.basename(Dir.pwd) == name
      end
    end
  end
end
