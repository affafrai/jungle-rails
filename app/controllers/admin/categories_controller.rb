class Admin::CategoriesController < ApplicationController
  USER_ID, PASSWORD = "jungle", "book"

  before_filter :authenticate

  def index
    @categories = Category.order(id: :desc).all
    # @category = Category.find(params[:id])
    # @products = @category.products.order(created_at: :desc)

  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end



  
  def authenticate
    
     authenticate_or_request_with_http_basic do |id, password| 
      
        id == USER_ID && password == PASSWORD
     end
  end


end
