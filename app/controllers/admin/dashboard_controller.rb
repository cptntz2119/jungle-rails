class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTH_NAME"], password: ENV["AUTH_PASS"]

  def show
    @products = Product.count(:all) 
    @categories = Category.count(:all) 
  end

end
