class ProductsController < ApplicationController

  def index
    # Code for listing all products goes here.
    @products = Product.all
    render :index
  end

  def new
    # Code for new product form goes here.
    @product = Product.new
    render :new
  end

  def create
    # Code for creating a new product goes here.
    @product = Product.new(product_params)
    if @album.save
      redirect_to products_path
    else
      render :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

  def edit
    # Code for editing a product form goes here.
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single product goes here.
    @product = Product.find(params[:id])
    render :show
  end

  def update
    # Code for updating a product goes here.
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting a product goes here.
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path
  end
end