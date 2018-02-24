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
    @user = User.find_by(username: params[:username])
    if params[:username] == "" || params[:password] == ""
      flash[:message] = "You have left one or more fields blank. Please try again."
      redirect '/login'
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/drills'
    else
      flash[:message] = "You have entered an incorrect password/username. Please try again, or create an account."
      redirect '/login'
    end
  end

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @drills = @user.drills
      @drills.order! 'created_at DESC'
      erb :'/users/show_all'
    else
      redirect '/login'
    end
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
