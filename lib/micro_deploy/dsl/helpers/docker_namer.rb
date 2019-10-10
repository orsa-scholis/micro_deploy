# frozen_string_literal: true

module MicroDeploy
  module DSL
    module Helpers
      module DockerNamer
        def container_name(supplement = '')
          "#{project_name}_#{project_environment}#{format_supplement(supplement)}"
        end

        def image_name(supplement = '')
          "/#{project_name}#{format_supplement(supplement)}:#{project_environment}"
        end

        private

        def format_supplement(supplement)
          return '' if supplement.nil?

          supplement.empty? ? '' : '_' + supplement
        end
      end
    end
  end
end
