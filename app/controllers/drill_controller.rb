require 'pry'
require 'rack-flash'

class DrillController < ApplicationController
  use Rack::Flash

  get '/drills' do
    if logged_in?
      @categories = ["Shooting", "Passing", "Heading", "Tackling", "Dribbling", "Conditioning"]
      @drills = Drill.all
      @drills.order! 'created_at DESC'
      erb :'/drills/drills_index'
    else
      redirect '/login'
    end
  end

  get '/drills/new' do
    if logged_in?
      erb :'/drills/create_drill'
    else
      redirect '/login'
    end
  end

  post '/drills' do
    if params[:user][:drill][:title] == "" || params[:user][:drill][:content] == "" || params[:user][:drill][:categories][:name] == ""
       flash[:message] = "You have left one or more fields blank. Please try again."
       redirect '/drills/new'
    else
       @drill = current_user.drills.create(:title => params[:user][:drill][:title], :content => params[:user][:drill][:content])
       category = Category.find_by(:name => params[:user][:drill][:categories][:name])
       @drill.categories << category
     end
     redirect "/categories/#{@drill.categories.first.name}"
  end

  get '/drills/:id' do
    if logged_in?
      @drill = Drill.find_by_id(params[:id])
      erb :'/drills/show_single_drill'
    else
      flash[:message] = "You cannot view that page until you have logged in. Please login to continue."
      redirect '/login'
    end
  end

  get '/drills/:id/edit' do
    @drill = Drill.find(params[:id])
    if logged_in? && @drill.user_id == current_user.id
      erb :'/drills/edit_drill'
    else
      flash[:message] = "You do not have permission to edit another user's drill!"
      redirect '/login'
    end
  end

  patch '/drills/:id' do

  end

  delete '/drills/:id/delete' do

  end
end
