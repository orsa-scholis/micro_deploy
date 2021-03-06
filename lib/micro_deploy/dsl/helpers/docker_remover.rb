# frozen_string_literal: true

require_relative '../docker'
require_relative '../docker_container'

module MicroDeploy
  module DSL
    module Helpers
      module DockerRemover
        def remove_docker_container(docker_name_supplement = nil)
          container = DockerContainer.new container_name(docker_name_supplement)

          container.remove if container.dangling?
        end
      end
    end
  end
end
