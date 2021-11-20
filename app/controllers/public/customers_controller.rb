class Public::CustomersController < ApplicationController


    def show
    end
    
    def edit
        @customer = current_customer
        
    end
    
    def unsubscribe
    end
    
    def update
      @customer = Customer.find(params[:id])
      @customer.update(customer_params)
      redirect_to customers_my_page_path
    end
    
    
  private

def customer_params
  params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:zip_code,:address,:telephone_number,:password,:email,:is_valid)
end

end
