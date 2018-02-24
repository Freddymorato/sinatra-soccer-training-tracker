require 'pry'
require 'rack-flash'

class DrillController < ApplicationController
  use Rack::Flash

  get '/drills' do
    if logged_in?
      @categories = ["Shooting", "Passing", "Heading", "Tackling", "Dribbling", "Conditioning"]
    
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