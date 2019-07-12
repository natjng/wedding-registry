class ItemsController < ApplicationController
    get '/items' do 
        @user = User.find(2)
        # change to User.find(session[:user_id])
        @items = Item.all
        erb :'items/index'
        # show all users items
    end

    

    get '/items/:id' do 
        @item = Item.find(params[:id])
        erb :'items/show'
    end

end