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
    else
      redirect '/login'
    end  
  end

  get '/drills/:id/edit' do
    
  end

  patch '/drills/:id' do
    
  end

  delete '/drills/:id/delete' do
    
  end
end