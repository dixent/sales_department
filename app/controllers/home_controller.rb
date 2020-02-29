class HomeController < ApplicationController
  def index; flash[:primary] = 'Welcome to Home!'; end
end
