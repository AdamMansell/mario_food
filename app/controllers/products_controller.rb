class ProductsController < ApplicationController
  def index
    # Code for listing all products goes here.
    @products = Product.all
    @most_recent_products = Product.order(created_at: :desc).limit(3)
  end

  def new
    # Code for new product form goes here.
    @product = Product.new
  end

  def create
    # Code for creating a new product goes here.
    # binding.pry
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    # Code for editing a product form goes here.
    @product = Product.find(params[:id])
  end

  def show
    # Code for showing a single product goes here.
    @product = Product.find(params[:id])
  end

  def update
    # Code for updating a product goes here.
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting a product goes here.
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  
    def product_params
      # strong params, whitelisting attributes to be saved to the database
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end