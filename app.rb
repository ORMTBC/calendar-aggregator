require 'sinatra'
require 'pry'
require 'rb-readline'
require 'fb_graph2'
require 'json'
require 'httparty'
require 'dotenv'
Dotenv.load('development.env')

get '/events' do
  user = FbGraph2::User.new(ENV['USER_ID']).authenticate(ENV['FB_EXCHANGE_TOKEN'])
  user.fetch
  @events = []
  user.events.each_with_index do |event, index|
    @events << { id: event.id, event_name: event.name, start_time: event.start_time, description: event.description }
  end
  # get_calendar_events
  erb :index
end

def get_calendar_events
  test = HTTParty.get(ENV['G_CAL_URL'])
end
