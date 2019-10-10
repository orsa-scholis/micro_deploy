# frozen_string_literal: true

module MicroDeploy
  module DSL
    module Helpers
      module DockerComposeNamer
        def compose_project_name
          "#{project_name}_#{project_environment}"
        end
      end
    end
  end
end
