get '/foo', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
    "You're using Songbird version #{params['agent'][0]}"
  end
  
  get '/foo' do
    # Matches non-songbird browsers
  end

  get '/', :host_name => /^admin\./ do
    "Admin Area, Access denied!"
  end
  
  get '/', :provides => 'html' do
    haml :index
  end
  
  get '/', :provides => ['rss', 'atom', 'xml'] do
    builder :feed
  end
  set(:probability) { |value| condition { rand <= value } }

  get '/win_a_car', :probability => 0.1 do
    "You won!"
  end
  
  get '/win_a_car' do
    "Sorry, you lost."
  end

  set(:auth) do |*roles|   # <- notice the splat here
    condition do
      unless logged_in? && roles.any? {|role| current_user.in_role? role }
        redirect "/login/", 303
      end
    end
  end
  
  get "/my/account/", :auth => [:user, :admin] do
    "Your Account Details"
  end
  
  get "/only/admin/", :auth => :admin do
    "Only admins are allowed here!"
  end

