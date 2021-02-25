class ApiService
  attr_reader :response
   def initialize(options = {})
     @response = {}
   end

  def call
    self.response[:data]  = fetch
  rescue StandardError => ex
    puts "An error of type #{ex.class}, error message is #{ex.message}"
  end

  private

  def fetch
    ContentfulClientWrapper.new.recipes
  end

end
