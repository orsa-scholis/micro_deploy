# frozen_string_literal: true

require 'micro_deploy/dsl/helpers/docker_builder'
require 'micro_deploy/dsl/helpers/docker_runner'
require 'micro_deploy/dsl/helpers/docker_stopper'
require 'micro_deploy/dsl/helpers/docker_remover'
require 'micro_deploy/dsl/helpers/environment_loader'
require 'micro_deploy/dsl/helpers/docker_namer'
require 'micro_deploy/dsl/helpers/docker_compose_upper'
require 'micro_deploy/dsl/helpers/docker_compose_downer'
require 'micro_deploy/dsl/helpers/project_infos'

module MicroDeploy
  module DSL
    class TaskContext
      include Helpers::DockerBuilder
      include Helpers::DockerRunner
      include Helpers::DockerStopper
      include Helpers::DockerRemover
      include Helpers::EnvironmentLoader
      include Helpers::DockerNamer
      include Helpers::DockerComposeUpper
      include Helpers::DockerComposeDowner
      include Helpers::ProjectInfos

      attr_reader :args, :site_directory

      def initialize(args, file, site_directory)
        @args = args
        @file = file
        @site_directory = File.expand_path site_directory
      end

      def call
        instance_eval File.open(@file, 'r:UTF-8', &:read)
      end

      def in_directory(path, &block)
        Dir.chdir(path, &block) if block_given?
      end

      def project_path
        args[:project_path]
      end
    end
  end
end
