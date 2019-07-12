class ItemsController < ApplicationController
    get '/items' do 
        @user = User.find(2)
        # change to User.find(session[:user_id])
        @items = Item.all
        erb :'items/index'
        # show all users items
    end

    get '/items/new' do 
        @categories = Category.all
        erb :'items/new'
    end

    post '/items' do 
        # params[:name] != ""
        if !params[:name].empty? && !params[:category_id].empty?
            @item = Item.create(name: params[:name], category_id: params[:category_id])
            @user = User.find(session[:user_id])
            @user.items << @item

            redirect "/items/#{@item.id}"

            # @item = Item.create(name: params[:name], category_id: params[:category_id], user_id: params[:user_id])
            # will user know about item this way?

        elsif !params[:name].empty? && !params["category_name"].empty?
            @item = Item.create(name: params[:name])
            @user = User.find(session[:user_id])
            @user.items << @item

            category = Category.create(params["category_name"])
            category.items << @item

            redirect "/items/#{@item.id}"
        else
            redirect '/items/new'
        end
    end

    get '/items/:id' do 
        @item = Item.find(params[:id])
        erb :'items/show'
    end

end