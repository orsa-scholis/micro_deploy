# frozen_string_literal: true

require 'micro_deploy/version'

RSpec.describe MicroDeploy do
  it 'has a version number' do
    expect(MicroDeploy::VERSION).not_to be nil
  end
end
