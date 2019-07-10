class UsersController < ApplicationController
    get '/users' do 
        @user = User.find(1)
        # need to change later
        erb :'users/show'
    end

    get '/users/signup' do 
        erb :'users/signup'
    end

    get '/users/login' do 
        erb :'users/login'
    end
end