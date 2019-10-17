# frozen_string_literal: true

require 'thor'

module MicroDeploy
  module CLI
    class ProjectGenerateGroup < Thor::Group
      REPOSITORY_DIRECTORY = 'repository.git'

      include Thor::Actions

      argument :name, type: :string, desc: 'The name of the project'

      def check_if_git_is_installed
        git_warning unless git_installed?
      end

      def setup_git
        system! "git init --bare #{REPOSITORY_DIRECTORY}", "Initialize empty git repository at #{REPOSITORY_DIRECTORY}"
      end

      private

      def git_installed?
        system 'git --version'
      end

      def git_warning
        warn 'Git is not installed!'
        exit 1
      end
    end
  end
end
