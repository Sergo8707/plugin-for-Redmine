require 'redmine'

Redmine::Plugin.register :link_plugin do
  name 'Sergo plugin'
  author 'Sergiy Drach'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/Sergo8707/plugin-for-Redmine'
  author_url 'https://github.com/Sergo8707'

  settings \
    :default => {'empty' => true},
    :partial => 'settings/settings'
end
