# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../../lib/app'
require_relative '../../lib/move'
#requires all DTOs
Dir[File.join(File.dirname(__FILE__), '../../lib/DTO', '*.rb')].each {|file| require_relative file }

require_relative '../test_helper'

require 'pry'

include TestHelper

describe App do
  describe "#settings" do
    it 'returns proper application settings' do
      assert_equal(App.settings.keys, [:apiversion, :author, :color, :head, :tail, :version])
    end
  end

  describe "#move" do
    example_request = parsed_request_data('test/request_data/moveRequest.json')
    subject = App.new(example_request)

    it 'returns a valid move' do
      assert_equal(subject.move, { move: 'up' })
    end
  end
end
