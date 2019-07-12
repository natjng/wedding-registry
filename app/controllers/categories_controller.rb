class CategoriesController < ApplicationController
    get '/categories' do 
        @categories = Category.all
        @user = User.find(3)
        erb :'categories/index'

        # edit to show categories for users items in their registry
    end
end