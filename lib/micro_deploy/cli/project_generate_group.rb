# frozen_string_literal: true

require 'thor'

module MicroDeploy
  module CLI
    class ProjectGenerateGroup < Thor::Group
      REPOSITORY_DIRECTORY = 'repository.git'

      include Thor::Actions

      argument :name, type: :string, desc: 'The name of the project'

      def setup_git
        system! "git init --bare #{REPOSITORY_DIRECTORY}", "Initialize empty git repository at #{REPOSITORY_DIRECTORY}"
      end
    end
  end
end
