require 'redmine'

require_dependency 'task_link/task_update_listener'

Rails.application.config.to_prepare do
  AttachmentsController.send :include, TaskLink::AttachmentPatch
  IssueRelationsController.send :include, TaskLink::IssueRelationsPatch
end

Redmine::Plugin.register :plugin_for_Redmine do
  name 'Sergo plugin'
  author 'Sergiy Drach'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/Sergo8707/plugin_for_Redmine'
  author_url 'https://github.com/Sergo8707'

  settings default: { 'request_url' => 'http://requestb.in/' },
           partial: 'settings/task_link_settings'
end
