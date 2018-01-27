# frozen_string_literal: true

require 'sequel'
require 'safe_yaml'

module Services
  def self.configure!
    load_config
  end

  def self.load_config
    SafeYAML::OPTIONS[:default_mode] = :safe
    @config = SafeYAML.load_file('./config/config.yaml')
  end

  def self.database
    @database ||= Sequel.connect(@config['database']['endpoint'])
  end
end
