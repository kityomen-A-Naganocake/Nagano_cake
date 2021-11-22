class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item

    def add_tax_price_no_tax
        (item.price_no_tax * 1.10).floor
    end

    def total_price
        item.add_tax_price_no_tax * quantity
    end

end
