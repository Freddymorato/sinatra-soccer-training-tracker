require 'pry'
require 'rack-flash'

class CategoryController < ApplicationController
  use Rack::Flash

  get '/categories/:category' do
    if logged_in?
      @category = Category.find_by(:name => params[:category])
      @drills =  @category.drills
      @drills.order! 'created_at DESC'
      erb :'/categories/show_by_cat'
    else
      flash[:message] = "You cannot view that page until you have logged in. Please login to continue."
      redirect '/login'
    end
  end
end
