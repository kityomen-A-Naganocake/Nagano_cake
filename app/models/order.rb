class Order < ApplicationRecord
    # enumでクレジットカード・銀行振り込みなのか選択のため
    enum payment_method: { credit_card:0, transfer:1 }
    
    belongs_to :customer
	  has_many   :order_details, dependent: :destroy
  	enum payment: [:クレジットカード, :銀行振込]
    
    # 税込金額計算のため
    def add_tax_price_no_tax
        (item.price_no_tax * 1.10).floor
    end

    def sub_total
        item.add_tax_price_no_tax * quantity
    end
end
