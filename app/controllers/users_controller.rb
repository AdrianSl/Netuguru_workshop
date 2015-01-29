class UsersController < ApplicationController
  expose(:category)
  expose(:product)
  expose_decorated(:reviews, ancestor: :product)

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(created_at: :desc).take(5)
  end

end
