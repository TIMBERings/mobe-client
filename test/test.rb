require_relative '../lib/mobe-client'
require 'webmock/rspec'

describe 'mobe-client' do

  describe 'register_mock_response' do
    it 'has the proper format' do
      configurations = {}
      configurations['method'] = 'GET'
      configurations['path'] = '/teams/1096538'
      configurations['response'] = '{"result":"test"}'
      configurations['statusCode'] = '200'

      url = 'http://localhost:8000/mobe/response/register'
      stub_request(:post, url)
          .with(:body => configurations.to_json,
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      register_mock_response('localhost', 8000, configurations)
      expect(WebMock).to have_requested(:post, url).with(:body => configurations.to_json).once
    end
  end

  describe 'unregister_mock_response' do
    it 'has the proper format' do
      configurations = {}
      configurations['method'] = 'GET'
      configurations['path'] = '/teams/1096538'
      configurations['response'] = '{"result":"test"}'
      configurations['statusCode'] = '200'

      url = 'http://localhost:8000/mobe/response/unregister'
      stub_request(:post, url)
          .with(:body => configurations.to_json,
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      unregister_mock_response('localhost', 8000, configurations)
      expect(WebMock).to have_requested(:post, url).with(:body => configurations.to_json).once
    end
  end

  describe 'unregister_all_mock_responses' do
    it 'has the proper format' do
      url = 'http://localhost:8000/mobe/response/unregister_all'
      stub_request(:post, url)
          .with(:body => '',
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      unregister_all_mock_responses('localhost', 8000)
      expect(WebMock).to have_requested(:post, url).with(:body => '').once
    end
  end

  describe 'register_intercept' do
    it 'has the proper format' do
      configurations = {}
      configurations['method'] = 'POST'
      configurations['path'] = '/teams/1096538'
      configurations['response'] = '{"result":"test"}'
      configurations['statusCode'] = '200'

      url = 'http://localhost:8000/mobe/intercept/register'
      stub_request(:post, url)
          .with(:body => configurations.to_json,
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      register_intercept('localhost', 8000, configurations)
      expect(WebMock).to have_requested(:post, url).with(:body => configurations.to_json).once
    end
  end

  describe 'unregister_intercept' do
    it 'has the proper format' do
      configurations = {}
      configurations['method'] = 'POST'
      configurations['path'] = '/teams/1096538'

      url = 'http://localhost:8000/mobe/intercept/unregister'
      stub_request(:post, url)
          .with(:body => configurations.to_json,
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      unregister_intercept('localhost', 8000, configurations)
      expect(WebMock).to have_requested(:post, url).with(:body => configurations.to_json).once
    end
  end

  describe 'unregister_all_intercepts' do
    it 'has the proper format' do
      url = 'http://localhost:8000/mobe/intercept/unregister_all'
      stub_request(:post, url)
          .with(:body => '',
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      unregister_all_intercepts('localhost', 8000)
      expect(WebMock).to have_requested(:post, url).with(:body => '').once
    end
  end

  describe 'get_intercept' do
    it 'has the proper format' do
      configurations = {}
      configurations['method'] = 'POST'
      configurations['path'] = '/teams/1096538'

      url = 'http://localhost:8000/mobe/intercept/get'
      stub_request(:post, url)
          .with(:body => configurations.to_json,
                :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'})
          .to_return(:status => 200, :body => '', :headers => {})

      get_intercept('localhost', 8000, configurations)
      expect(WebMock).to have_requested(:post, url).with(:body => configurations.to_json).once
    end
  end
end

