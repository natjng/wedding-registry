class UsersController < ApplicationController
    get '/users/signup' do 
        erb :'users/signup'
    end

    post '/users/signup' do 
        if params[:username] == "" || params[:password] == ""
            redirect '/users/signup'
        else
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        end
        # add username and password creation validations
    end

    get '/users/login' do 
        erb :'users/login'
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
        session.clear
        redirect '/'
    end

    get '/users/:id' do 
        @user = User.find(session[:user_id])
        erb :'users/show'
    end

end