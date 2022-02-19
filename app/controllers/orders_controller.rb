class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.create(order_params)
    @order.user_id = current_user.id
    order_save
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:count_product)
  end

  def order_save
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end
