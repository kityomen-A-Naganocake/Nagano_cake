class Order < ApplicationRecord
    enum payment_method: { credit_card:0, transfer:1 }
    
    belongs_to :customer
	  has_many   :order_details, dependent: :destroy
  	enum payment: [:クレジットカード, :銀行振込]
    
    def add_tax_price_no_tax
        (item.price_no_tax * 1.10).floor
    end

    def sub_total
        item.add_tax_price_no_tax * quantity
    end
    def subu_total
        item.add_tax_price_no_tax * quantity + shipping_cost
    end
end
