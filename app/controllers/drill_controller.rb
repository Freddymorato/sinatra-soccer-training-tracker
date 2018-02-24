
class DrillController < ApplicationController 

  get '/drills' do
    if logged_in?
      erb:'/drills/drills_index'
    else
      redirect '/login'
    end
  end

  get '/drills/new' do
    
  end

  post '/drills' do
    
  end

  get '/drills/:id' do
    
  end

  get '/drills/:id/edit' do
    
  end

  patch '/drills/:id' do
    
  end

  delete '/drills/:id/delete' do
    
  end
end