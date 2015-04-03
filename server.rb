require 'sinatra'
require 'resque'
require 'json'

require_relative 'workers/hello_ruby'
require_relative 'workers/hello_go'

get('/go') do
  Resque.enqueue(HelloGo)

  content_type :json
  { job: :HelloGo, enqueued: true }.to_json
end

get('/ruby') do
  Resque.enqueue(HelloRuby)

  content_type :json
  { jobs: :HelloRuby, enqueued: true }.to_json
end

get('/queues') do
  content_type :json

  out = [];
  Resque.queues.each do |q|
    out << {name: q, count: Resque.size(q)}
  end
  out.to_json
end
