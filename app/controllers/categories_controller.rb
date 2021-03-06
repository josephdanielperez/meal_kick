class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @category = Category.new
    end 

    def create 
        @category = Category.create(category_params)
        if @category.save
          flash[:message] = "Category saved!"
          redirect_to category_path(@category)
        else
          render :new
        end
    end  
    
    
    def index 
        @categories = Category.all.includes(:recipes)
    end 

    def show 
        @category = Category.find_by(id: params[:id])
    end   
    
    private 

    def category_params
        params.require(:category).permit(:name, :recipe_id)
    end 

end
