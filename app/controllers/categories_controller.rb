class CategoriesController < ApplicationController
    get '/categories' do 
        @categories = Category.all
        @user = User.find(session[:user_id])
        erb :'categories/index'
    end

    get '/categories/new' do 
        erb :'categories/new'
    end

    post '/categories' do
        if !params[:name].empty?
            @category = Category.create(params)
            redirect "/categories/#{@category.id}"
        else
            redirect 'categories/new'
        end
    end

    get '/categories/:id' do 
        @category = Category.find(params[:id])
        @user = User.find(session[:user_id])
        erb :'categories/show'
    end

    get '/categories/:id/edit' do
        @category = Category.find(params[:id])
        erb :'categories/edit'
    end

    patch '/categories/:id' do 
        @category = Category.find(params[:id])
        if !params[:name].empty?
            @category.update(params)
            redirect "/categories/#{@category.id}"
        else
            redirect 'categories/#{@category.id}/edit'
        end
    end

    delete '/categories/:id' do 
        @category = Category.find(params[:id])
        @category.destroy
        redirect '/categories'

        # edit to only allow users to delete own categories
    end

end