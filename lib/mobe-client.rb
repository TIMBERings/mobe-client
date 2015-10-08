require 'net/http'
require 'json'
require 'uri'


CONTENT_TYPE = 'application/json'

#Registers a mock response for a given path
#@param server [String]
#@param port [Fixnum]
#@param configurations [Hash] JSON representation of a string
#@option configurations [String] :method Method for the mocked response.
#@option configurations [String] :path Path for the mocked response.
#@option configurations [String] :response The response for the mocked response.
#@option configurations [String] :statusCode The status code for the mocked response.
def register_mock_response(server, port, configurations)
  check_for_register_arguments(configurations)
  configurations = configurations.to_json

  uri = URI('http://' + server + ':' + port.to_s + '/mobe/response/register')
  req = Net::HTTP::Post.new uri.path
  req.body = configurations
  req.content_type = CONTENT_TYPE

  res = Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end

  if res.code != '200'
    raise Exception.new("POST failed. Error code: #{res.code}")
  end
end


#Registers an intercept for a given path
#@param server [String]
#@param port [Fixnum]
#@param configurations [Hash] JSON representation of a string
#@option configurations [String] :method Method for the mocked response.
#@option configurations [String] :path Path for the mocked response.
#@option configurations [String] :response The response for the mocked response.
#@option configurations [String] :statusCode The status code for the mocked response.
def register_intercept(server, port, configurations)
  check_for_register_arguments(configurations)
  configurations = configurations.to_json

  uri = URI('http://' + server + ':' + port.to_s + '/mobe/intercept/register')
  req = Net::HTTP::Post.new uri.path

  req.body = configurations
  req.content_type = CONTENT_TYPE

  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end
end

#Retrieves an intercept from a given path
#@param server [String]
#@param port [Fixnum]
#@param configurations [Hash] JSON representation of a string
#@option configurations [String] :method Method for the mocked response.
#@option configurations [String] :path Path for the mocked response.
#@return [Hash] The intercepted request
def get_intercept(server, port, configurations)
  check_for_get_arguments(configurations)
  configurations = configurations.to_json

  uri = URI('http://' + server + ':' + port.to_s + '/mobe/intercept/get')
  req = Net::HTTP::Post.new uri.path

  req.body = configurations
  req.content_type = CONTENT_TYPE

  res = Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end

  return res.body
end

#Unregisters a mock response for a given path
#@param server [String]
#@param port [Fixnum]
#@param configurations [Hash] JSON representation of a string
#@option configurations [String] :method Method for the mocked response.
#@option configurations [String] :path Path for the mocked response.
def unregister_mock_response(server, port, configurations)
  check_for_get_arguments(configurations)
  configurations = configurations.to_json

  uri = URI('http://' + server + ':' + port.to_s + '/mobe/response/unregister')
  req = Net::HTTP::Post.new uri.path

  req.body = configurations
  req.content_type = CONTENT_TYPE

  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end
end

#Unregisters an intercept for a given path
#@param server [String]
#@param port [Fixnum]
#@param configurations [Hash] JSON representation of a string
#@option configurations [String] :method Method for the mocked response.
#@option configurations [String] :path Path for the mocked response.
def unregister_intercept(server, port, configurations)
  check_for_get_arguments(configurations)
  configurations = configurations.to_json

  uri = URI('http://' + server + ':' + port.to_s + '/mobe/intercept/unregister')
  req = Net::HTTP::Post.new uri.path

  req.body = configurations
  req.content_type = CONTENT_TYPE

  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end
end

#Unregisters all intercepts
#@param server [String]
#@param port [Fixnum]
def unregister_all_intercepts(server, port)
  uri = URI('http://' + server + ':' + port.to_s + '/mobe/intercept/unregister_all')
  req = Net::HTTP::Post.new uri.path

  req.content_type = CONTENT_TYPE

  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end
end

#Unregisters all mock responses
#@param server [String]
#@param port [Fixnum]
def unregister_all_mock_responses(server, port)
  uri = URI('http://' + server + ':' + port.to_s + '/mobe/response/unregister_all')
  req = Net::HTTP::Post.new uri.path

  req.content_type = CONTENT_TYPE

  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request req
  end
end

private
# Ensures configurations has the keys 'method', 'path', 'response', 'statusCode'
# @param configurations [Hash]
def check_for_register_arguments(configurations)
  raise ArgumentError.new("Configurations doesn't have the correct keys: 'method', 'path','response', and 'statusCode'." ) unless (configurations.has_key?('method') && configurations.has_key?('path') && configurations.has_key?('response') && configurations.has_key?('statusCode'))
end

# Ensures configurations has the keys 'method', 'path'
# @param configurations [Hash]
def check_for_get_arguments(configurations)
  raise ArgumentError.new("Configurations doesn't have the correct keys: 'method' and 'path'." ) unless (configurations.has_key?('method') && configurations.has_key?('path'))
end
