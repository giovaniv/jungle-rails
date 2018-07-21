class ReviewsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)

    if @review.save
      redirect_to :back
    else
      render :new
    end

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def reviews_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating
    )
  end

end