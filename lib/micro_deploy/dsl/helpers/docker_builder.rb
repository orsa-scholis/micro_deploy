# frozen_string_literal: true

require_relative '../docker'

module MicroDeploy
  module DSL
    module Helpers
      module DockerBuilder
        def build_image(options)
          docker_name_supplement = options.delete :docker_name_supplement

          Docker.new('build', merge_options(options, docker_name_supplement), options[:base_path], '.').execute
        end

        private

        def merge_options(options, docker_name_supplement)
          options.merge(
            base_path: Dir.pwd,
            tag: image_name(docker_name_supplement),
            dockerfile_path: 'prod.Dockerfile'
          )
        end
      end
    end
  end
end
