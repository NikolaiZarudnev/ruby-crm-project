class ProductsController < ApplicationController
    # frozen_string_literal: true
    load_and_authorize_resource
    def index
      @products = Product.all
    end
  
    def search
      @products = Product.all
      @products = @products.where('name LIKE ?', "%#{params[:q]}%")
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
      
      @product = Product.new
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def create
      if params['product']['image'].nil? then params['product']['image'] = 'none.jpg'
      else
        image_load
      end
      @product = Product.new(product_params)
      product_save
    end
  
    def update
      @product = Product.find(params[:id])
      image_load unless params['image'].nil?
      product_update
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end
  
    private
  
    def product_params
      params.require(:product).permit(:title, :description, :image)
    end
  
    def product_save
      if @product.save
        redirect_to @product
      else
        render 'new'
      end
    end
  
    def product_update
      if @product.update(product_params)
        redirect_to @product
      else
        render 'edit'
      end
    end
  
    def image_load
      uploaded_io = product_params['image']
      File.binwrite(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename),
                    uploaded_io.read)
      params['product']['image'] = uploaded_io.original_filename
    end
  
end
