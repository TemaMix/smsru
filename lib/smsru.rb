require File.expand_path('../smsru/status', __FILE__)
require File.expand_path('../smsru/api', __FILE__)

module Smsru
  include Status
  
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :mail, :api_id, :phone, :sms_url, :from

    def initialize
      self.from = ''
      self.mail = ''
      self.phone = ''
      self.sms_url = "http://sms.ru/sms/send?"
      self.api_id = ''
    end
  end
end
