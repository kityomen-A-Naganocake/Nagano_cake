class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  
  
  # 制作ステータス
  enum production_status: { not_permitted: 0, waiting_for_production: 1, in_production: 2, complete_production: 3}

end

