require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "You have left one or more fields blank!"
      redirect '/signup'
    elsif User.find_by(:username => params[:username]) || User.find_by(:email => params[:email])
      flash[:message] = "That username/email is already in use. Please try again."
      redirect '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Thank you for signing up for Soccer Training Tracker!"
      redirect '/login'
    end
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
