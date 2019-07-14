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
        if !params[:name].empty? && params["category_name"] != ""
            @item = Item.create(name: params[:name])
            current_user.items << @item
            @category = Category.find_or_create_by(name: params[:category_name])
            @category.items << @item
            redirect "/items/#{@item.id}"
        elsif !params[:name].empty? && !!params[:category_id]
            @item = Item.create(name: params[:name], category_id: params[:category_id])
            current_user.items << @item
            redirect "/items/#{@item.id}"
        else
            redirect '/items/new'
        end
    end

    get '/items/:id' do 
        if logged_in?
            @item = Item.find_by_id(params[:id])
            if @item && @item.user == current_user
                erb :'items/show'
            else
                redirect '/items'
            end
        else
            redirect 'users/login'
        end
    end

    get '/items/:id/edit' do 
        if logged_in?
            @item = Item.find_by_id(params[:id])
            if @item && @item.user == current_user
                erb :'items/edit'
            else
                redirect '/items'
            end
        else
            redirect 'users/login'
        end
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
        if logged_in?
            @item = Item.find(params[:id])
            @item.destroy
            redirect '/items'
        else
            redirect 'users/login'
        end
    end

end