class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
  end

  def new
    @supplier = Supplier.new
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @user = current_user
    @user.is_supplier = true
    @supplier = Supplier.create(user: @user)
    @supplier.company = params['supplier']['company']
    @user.save
    supplier_save
  end

  def update
    @supplier = Supplier.find(params[:id])
    supplier_update
  end

  private

  def supplier_params
    params.require(:supplier).permit(:company)
  end

  def supplier_save
    if @supplier.save
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def supplier_update
    if @supplier.update(supplier_params)
      redirect_to @supplier
    else
      render 'edit'
    end
  end
end
