class ApiController < ApplicationController
  def index
    #call service layer.
    @recipes = ApiService.new().call
  end
end
