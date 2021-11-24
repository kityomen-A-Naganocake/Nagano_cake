class Order < ApplicationRecord
    # enumでクレジットカード・銀行振り込みなのか選択のため
    enum payment_method: { credit_card:0, transfer:1 }
    belongs_to :customer
	has_many   :order_details, dependent: :destroy
  	enum payment: [:クレジットカード, :銀行振込]
   
       # 注文ステータス：　0.入金待ち・1.入金確認・2.製作中・3.発送準備中・4.発送済み   enum
    enum status: { waiting_for_payment: 0, confirmation_of_payment: 1, in_production: 2, in_preparation_for_shipment: 3, already_shipped: 4}
    
    
    # 税込金額計算のため
    def add_tax_price_no_tax
        (item.price_no_tax * 1.10).floor
    end

    def sub_total
        item.add_tax_price_no_tax * quantity
    end
end
