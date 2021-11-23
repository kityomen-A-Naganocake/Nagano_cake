class Item < ApplicationRecord
    attachment :image
    validates :name, :price_no_tax, :genre_id, :description, :image, presence:true
    validates :is_active, inclusion:  {in: [true, false]}
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    
    def  add_tax_price_no_tax
        (self.price_no_tax * 1.10).round
    end
    

end
