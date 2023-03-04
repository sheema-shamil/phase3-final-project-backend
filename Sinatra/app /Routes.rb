get '/' do
    .. show something ..
  end
  
  post '/' do
    .. create something ..
  end
  
  put '/' do
    .. replace something ..
  end
  
  patch '/' do
    .. modify something ..
  end
  
  delete '/' do
    .. annihilate something ..
  end
  
  options '/' do
    .. appease something ..
  end
  
  link '/' do
    .. affiliate something ..
  end
  
  unlink '/' do
    .. separate something ..
  end

  get '/foo' do
    # Does not match "GET /foo/"
  end
  get '/hello/:name' do
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    "Hello #{params['name']}!"
  end

  get '/hello/:name' do |n|
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    # n stores params['name']
    "Hello #{n}!"
  end

  get '/say/*/to/*' do
    # matches /say/hello/to/world
    params['splat'] # => ["hello", "world"]
  end
  
  get '/download/*.*' do
    # matches /download/path/to/file.xml
    params['splat'] # => ["path/to/file", "xml"]
  end
  get '/download/*.*' do |path, ext|
    [path, ext] # => ["path/to/file", "xml"]
  end

  get /\/hello\/([\w]+)/ do
    "Hello, #{params['captures'].first}!"
  end


  get %r{/hello/([\w]+)} do |c|
    # Matches "GET /meta/hello/world", "GET /hello/world/1234" etc.
    "Hello, #{c}!"
  end

  get '/posts' do
    # matches "GET /posts?title=foo&author=bar"
    title = params['title']
    author = params['author']
    # uses title and author variables; query is optional to the /posts route
  end


get '\A/posts\z', :mustermann_opts => { :type => :regexp, :check_anchors => false } do
  # matches /posts exactly, with explicit anchoring
  "If you match an anchored pattern clap your hands!"
end

  