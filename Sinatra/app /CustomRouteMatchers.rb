

class AllButPattern
    def initialize(except)
      @except = except
    end
  
    def to_pattern(options)
      return self
    end
  
    def params(route)
      return {} unless @except === route
    end
  end
  
  def all_but(pattern)
    AllButPattern.new(pattern)
  end
  
  get all_but("/index") do
    # ...
  end

  get /.*/ do
    pass if request.path_info == "/index"
    # ...
  end
  