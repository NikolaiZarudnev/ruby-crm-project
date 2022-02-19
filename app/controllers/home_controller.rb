class HomeController < ApplicationController
    def index
        @products = Product.all
        @supplier = Supplier.find_by(user_id: current_user.id) if signed_in?
        
    end
end
