# frozen_string_literal: true

require 'cute_logger'
require 'kazoo'
require 'poseidon'

module Services
  class KafkaClient
    class EmptyQueue < StandardError
      def initialize
        super('There are no messages left')
      end
    end

    def initialize(brokers, topic)
      @writer = Poseidon::Producer.new(brokers, 'KafkaProducer')
      @reader = Poseidon::PartitionConsumer.new(
        'KafkaConsumer', 'localhost', 9092, topic, 0, :latest_offset
      )
      @messages = []
      @topic = topic
    end

    def deliver_message(message, topic = nil)
      topic ||= @topic
      @writer.send_messages([Poseidon::MessageToSend.new(topic, message)])
    end

    def read_message
      fetch if @messages.empty?
      m = @messages.shift
      raise(EmptyQueue) if m.nil?
      m.value
    end

    def fetch
      @messages = @reader.fetch
    end
  end

  def kafka_client
    KafkaClient.new(kafka_brokers, 'movies')
  end

  def kafka_brokers
    brokers = []
    zookeper_client.brokers.each_value { |broker| brokers << broker.addr }
    brokers
  end

  def zookeper_client
    Kazoo::Cluster.new('localhost:2181')
  end
end
