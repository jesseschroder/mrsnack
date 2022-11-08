require 'json'

module TestHelper
  def parsed_request_data(request_path)
    loaded_file = File.read(request_path)
    JSON.parse(loaded_file)
  end
end
