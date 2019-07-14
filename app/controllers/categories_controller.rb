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
            @category = Category.find_or_create_by(params)
            redirect "/categories/#{@category.id}"
        else
            redirect 'categories/new'
        end
    end

    get '/categories/:id' do 
        if logged_in?
            @category = Category.find_by_id(params[:id])
            @user_cat = current_user.categories.any?{|cat| cat == @category}
            if @category && @user_cat
                erb :'categories/show'
            else
                redirect '/categories'
            end
        else
            redirect 'users/login'
        end
    end

    get '/categories/:id/edit' do
        if logged_in?
            @category = Category.find_by_id(params[:id])
            @user_cat = current_user.categories.any?{|cat| cat == @category}
            if @category && @user_cat
                erb :'categories/edit'
            else
                redirect '/categories'
            end
        else
            redirect 'users/login'
        end
    end

    patch '/categories/:id' do 
        @category = Category.find(params[:id])
        if !params[:name].empty?
            @category.update(name: params[:name])
            redirect "/categories/#{@category.id}"
        else
            redirect "categories/#{@category.id}/edit"
        end
    end

    delete '/categories/:id' do
        if logged_in?
            @category = Category.find(params[:id])
            @category.destroy
            redirect '/categories'
        else
            redirect 'users/login'
        end
    end

    get '/categories/' do 
        redirect '/categories'
    end

end