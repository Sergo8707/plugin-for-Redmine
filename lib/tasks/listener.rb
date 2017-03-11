require_dependency 'issue'

module Listener
  def self.included(base)
    # наследуем родные методы
    base.extend(ClassMethods)
    # расширяем класс своими методами
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      # Отправляем выгружаемые файлы
      after_update :send_post
    end
  end

  module ClassMethods
  end
  module InstanceMethods
    def send_post
      input_link = Setting.link_plugin ['input_link']
      link = URI(input_link)
      http = Net::HTTP.new(link.host, link.port)

      params = { issueid: id, userid: User.current.id, datetime: updated_on }.to_json
      headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      http.post(uri.path, params, headers)
    rescue => e
    end
  end
end

# добавляем подготовку callback который будет запускаться перед запросом
Rails.configuration.to_prepare do
  Issue.send(:include, Listener) unless Issue.included_modules.include? Listener
end
