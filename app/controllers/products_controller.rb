# frozen_string_literal: true

class ProductsController < ApplicationController
  # frozen_string_literal: true
  load_and_authorize_resource
  def index
    @products = Product.all
  end

  def show
    @supplier = Supplier.find_by(user_id: current_user.id)
    @product = @supplier.products.find(params[:id])
  end

  def new
    @supplier = Supplier.find_by(user_id: current_user.id)
    @product = Product.new
  end

  def edit
    @supplier = Supplier.find_by(user_id: current_user.id)
    @product = @supplier.products.find(params[:id])
  end

  def create
    @supplier = Supplier.find_by(user_id: current_user.id)
    if params['product']['image'].nil? then params['product']['image'] = 'none.jpg'
    else
      image_load
    end
    @product = @supplier.products.create(product_params)
    redirect_to supplier_path(@supplier)
  end

  def update
    @supplier = Supplier.find_by(user_id: current_user.id)
    @product = @supplier.products.find(params[:id])

    image_load unless params['product']['image'].nil?

    @product.update(product_params)

    redirect_to supplier_path(@supplier)
  end

  def destroy
    @supplier = Supplier.find_by(user_id: current_user.id)
    @product = @supplier.products.find(params[:id])
    @product.destroy
    redirect_to supplier_path(@supplier)
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
