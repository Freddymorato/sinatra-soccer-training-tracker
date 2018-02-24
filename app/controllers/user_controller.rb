require 'rack-flash'

class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/drills'
    else
      erb :'/users/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/drills'
    end
  end

  post '/signup' do

  end

  post '/login' do

  end

  get '/users/:slug' do

  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end
end
