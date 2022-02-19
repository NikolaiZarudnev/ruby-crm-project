# frozen_string_literal: true

class ProductsController < ApplicationController
  # frozen_string_literal: true
  load_and_authorize_resource
  def index
    @products = Product.all
  end

  def show
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @product = Product.new
  end

  def edit
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    if params['product']['image'].nil? then params['product']['image'] = 'none.jpg'
    else
      image_load
    end
    @product = @user.products.create(product_params)
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])

    image_load unless params['product']['image'].nil?

    @product.update(product_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
    @product.destroy
    redirect_to user_path(@user)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :price)
  end

  def image_load
    uploaded_io = product_params['image']
    File.binwrite(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename),
                  uploaded_io.read)
    params['product']['image'] = uploaded_io.original_filename
  end
end
