class Item < ApplicationRecord
    attachment :image
    validates :name, :price_no_tax, :genre_id, :description, :image, presence:true
    validates :is_active, inclusion:  {in: [true, false]}
    belongs_to :genre
end
