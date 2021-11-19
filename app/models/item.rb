class Item < ApplicationRecord
    attachment :image
    validates :name, :price_no_tax, :genre_id, :is_active, :description, :image_id presence:true
end
