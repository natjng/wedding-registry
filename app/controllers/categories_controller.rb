class CategoriesController < ApplicationController
    get '/categories' do 
        if logged_in?
            erb :'categories/index'
        else
            redirect 'users/login'
        end
    end

    get '/categories/new' do 
        if logged_in?
            erb :'categories/new'
        else
            redirect 'users/login'
        end
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