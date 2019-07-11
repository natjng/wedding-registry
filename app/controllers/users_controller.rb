class UsersController < ApplicationController
    get '/users' do 
        @user = User.find(1)
        # change to User.find(session[:user_id])
        erb :'users/show'
        # need to change view later 'users/:id'
    end

    get '/users/signup' do 
        erb :'users/signup'
    end

    post '/users/signup' do 
        @user = User.new(params)
        # change to .create?
        # add username and password creation validations
        # log user in after successful signup
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

end