require 'redmine'

require_dependency 'task_update_listener'

Rails.application.config.to_prepare do
  AttachmentsController.send :include, TaskUpdateWatcher::AttachmentPatch
  IssueRelationsController.send :include, TaskUpdateWatcher::IssueRelationsPatch
end

Redmine::Plugin.register :link_plugin do
  name 'Sergo plugin'
  author 'Sergiy Drach'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/Sergo8707/plugin-for-Redmine'
  author_url 'https://github.com/Sergo8707'

  settings default: { 'request_url' => 'http://httpbin.org/post' },
           partial: 'settings/settings'
end
