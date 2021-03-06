class Admin::CustomersController < ApplicationController
  
  before_action :baria_admin


    def index
        #kaminariで１０件表示
        @customers = Customer.all.page(params[:page]).per(10)
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to admin_customers_path
      else
        render :edit
      end
    end

    private
    
  	def customer_params
  	  params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:zip_code,:address,:telephone_number,:password,:email,:is_deleted)
  	end
	
	
    def baria_admin
        unless admin_signed_in?
            redirect_to new_admin_session_path
        end
    end

end
