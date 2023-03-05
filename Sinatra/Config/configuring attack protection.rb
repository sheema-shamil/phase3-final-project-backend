disable :protection

set :protection, :except => :path_traversal

set :protection, :except => [:path_traversal, :session_hijacking]

set :protection, :session => true

