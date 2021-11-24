class ShippingAddress < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  # Addressモデル
  def full_address
    '〒' + zip_code + ' ' + address + ' ' + recipients_name
  end
end
