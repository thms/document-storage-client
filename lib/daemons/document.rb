#!/usr/bin/env ruby

# You might want to change this for production
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

require 'kafka'
require 'avro_turf/messaging'
require 'document_factory'

$running = true
Signal.trap("TERM") do 
  $running = false
end

# Offset is stored in Zookeeper and the client can specify :earliest_offset, :latest_offset, or an integer to replay from an arbitrary offset.
offset = :earliest_offset
# Load configuration
config = YAML::load_file('config/kafka.yml')[Rails.env]
host, port = config['kafka_connection'].first.split(':')
kafka = Kafka.new(:seed_brokers => ["#{host}:#{port}"])
avro = AvroTurf::Messaging.new(registry_url: "http://localhost:8081/", schemas_path: "app/schemas/")
while($running) do
  
  # ToDo: potentially reconnect to Kafka.
  
  # Consume event from the Kafka::Loan::Submitted topic
  # When a new loan gets submitted, read the data and create the document in the client
  # TODO: decent looping interval
  # Get most recent messages and process one by one (this is a blocking call with a timeout of 5-10 seconds)
  kafka.each_message(:topic => 'document') do |message|
    document = avro.decode(message.value).deep_symbolize_keys
    Rails.logger.info document.inspect
    begin
      DocumentFactory.create(document[:payload])
    rescue Exception => e
      Rails.logger.info e.message
    end
  end
  Rails.logger.flush
    
end


