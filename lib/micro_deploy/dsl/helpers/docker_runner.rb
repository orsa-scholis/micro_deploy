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
          container_name = container_name(docker_name_supplement)

          stop_docker_container(docker_name_supplement)
          remove_docker_container(docker_name_supplement)

          flags = DEFAULT_RUN_FLAGS.merge(
            name: container_name,
            network: 'traefik'
          ).merge(options)

          Docker.new('run', flags, image_name(docker_name_supplement))
                .explain('Starting docker image').execute
        end

        def migrate_rails_db(docker_name_supplement = '')
          flags = { remove: true, env_file: default_env_file }
          Docker.new('run', flags, image_name(docker_name_supplement), 'bin/rails', 'db:migrate').execute
        end

        def migrate_laravel_db(docker_name_supplement = '')
          flags = { remove: true, env_file: default_env_file }
          arguments = [image_name(docker_name_supplement)] + %w[php artisan migrate --no-interaction --force]
          Docker.new('run', flags, *arguments).execute
        end
      end
    end
  end
end
