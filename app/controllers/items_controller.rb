class ItemsController < ApplicationController
    get '/items' do
        if logged_in?
            erb :'items/index'
        else
            redirect 'users/login'
        end
    end

    get '/items/new' do 
        if logged_in?
            erb :'items/new'
        else
            redirect 'users/login'
        end
    end

    post '/items' do 
        @user = User.find(session[:user_id])

        if !params[:name].empty? && params["category_name"] != ""
            @item = Item.create(name: params[:name])
            @user.items << @item
            @category = Category.find_or_create_by(name: params[:category_name])
            # use find_or_create_by so user does not create duplicate categories
            @category.items << @item
            redirect "/items/#{@item.id}"
        elsif !params[:name].empty? && !!params[:category_id]
            @item = Item.create(name: params[:name], category_id: params[:category_id])
            @user.items << @item
            redirect "/items/#{@item.id}"
        else
            redirect '/items/new'
        end
    end

    get '/items/:id' do 
        @user = User.find(session[:user_id])
        @item = Item.find(params[:id])
        @categories = Category.all 
        erb :'items/show'
    end

    get '/items/:id/edit' do 
        @item = Item.find(params[:id])
        @categories = Category.all
        erb :'items/edit'
    end

    patch '/items/:id' do 
        @item = Item.find(params[:id])

        if !params[:name].empty? && params["category_name"] != ""
            @item.name = params[:name]
            @item.save

            @category = Category.find_or_create_by(name: params[:category_name])
            @category.items << @item

            redirect "/items/#{@item.id}"
        elsif !params[:name].empty? && !!params[:category_id]
            @item.name = params[:name]
            @item.category_id = params[:category_id]
            @item.save

            redirect "/items/#{@item.id}"
        else
            redirect "/items/#{@item.id}/edit"
        end
    end

    delete '/items/:id' do 
        @item = Item.find(params[:id])
        @item.destroy
        redirect '/items'

        # edit to only allow users to delete own items
    end

end