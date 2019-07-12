class CategoriesController < ApplicationController
    get '/categories' do 
        @categories = Category.all
        @user = User.find(3)
        erb :'categories/index'

        # edit to show categories for users items in their registry
    end

    get '/categories/new' do 
        erb :'categories/new'
    end

    get '/categories/:id' do 
        @category = Category.find(params[:id])
        @user = User.find(3)
        # change to @user = session[:user_id]

        erb :'categories/show'
    end

end