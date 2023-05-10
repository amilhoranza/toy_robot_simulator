# spec/web_spec.rb
require_relative '../web'
require 'rspec'
require 'rack/test'

RSpec.describe 'Toy Robot Web App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'loads the homepage' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Toy Robot Simulator')
    end
  end

  describe 'POST /execute' do
    it 'executes commands and returns the correct report' do
      post '/execute', { commands: "PLACE 1,2,EAST\nMOVE\nMOVE\nRIGHT\nMOVE\nREPORT" }
      expect(last_response).to be_ok
      expect(last_response.body).to include('Report: 3,3,SOUTH')
    end

    it 'ignores invalid commands' do
      post '/execute', { commands: "INVALID\nPLACE 1,2,EAST\nMOVE\nMOVE\nRIGHT\nMOVE\nREPORT" }
      expect(last_response).to be_ok
      expect(last_response.body).to include('Report: 3,3,SOUTH')
    end
  end
end
