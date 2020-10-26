class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new    
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product), notice: 'Successfuly created review!'
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end