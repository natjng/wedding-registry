class UsersController < ApplicationController
    get '/users/signup' do 
        erb :'users/signup'
    end

    post '/users/signup' do 
        @user = User.new(params)
        # change to .create?
        # add username and password creation validations
        # log user in after successful signup
        session[:user_id] = @user.id
        redirect '/users'
    end

    get '/users/login' do 
        erb :'users/login'
    end

    post '/users/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # redirect "users/#{@user.id}"
            # create route
        else
            redirect 'users/login'
        end
    end

    get '/users/:id' do 
        @user = User.find(session[:user_id])
        erb :'users/show'
    end

    get '/users/logout' do
        session.clear
        redirect '/'
    end

end