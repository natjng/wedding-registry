class UsersController < ApplicationController
    get '/users/signup' do
        if logged_in?
            redirect "users/#{current_user.id}"
        else
            erb :'users/signup'
        end
    end

    post '/users/signup' do 
        if params[:username] == "" || params[:username] == User.find_by(username: params[:username]).username || params[:password] == ""
            redirect '/users/signup'
        else
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        end
    end

    get '/users/login' do 
        if logged_in?
            redirect "users/#{current_user.id}"
        else
            erb :'users/login'
        end
    end

    post '/users/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else
            redirect 'users/login'
        end
    end

    get '/users/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect 'users/login'
        end
    end

    get '/users/:id' do 
        if logged_in?
            @current_user
            erb :'users/show'
        else
            redirect 'users/login'
        end
    end

end