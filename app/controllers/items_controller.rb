class ItemsController < ApplicationController
    get '/items' do 
        @user = User.find(2)
        # change to User.find(session[:user_id])
        @items = Item.all
        erb :'items/index'
        # show all users items
    end

    get '/items/new' do 
        erb :'items/new'
    end

    post '/items' do 
        # params[:name] != ""
        if !params[:name].empty?
            @item = Item.create(params)
            @user = User.find(session[:user_id])
            @user.items < @item
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