# frozen_string_literal: true

require_relative '../docker'

module MicroDeploy
  module DSL
    module Helpers
      module DockerRunner
        DEFAULT_RUN_FLAGS = {
          # remove: true,
          detached: true,
          restart: 'unless-stopped'
        }.freeze

        def start_docker_image(options)
          docker_name_supplement = options.delete :docker_name_supplement
          docker_name_prefix = options.delete :docker_name_prefix
          container_name = container_name(docker_name_supplement)

          stop_docker_container(docker_name_supplement)
          remove_docker_container(docker_name_supplement)

          flags = DEFAULT_RUN_FLAGS.merge(
            name: container_name,
            network: 'traefik'
          ).merge(options)

          Docker.new('run', flags, image_name(docker_name_prefix, docker_name_supplement))
                .explain('Starting docker image').execute
        end
      end
    end
  end
end
