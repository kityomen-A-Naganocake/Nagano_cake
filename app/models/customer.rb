class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # ログインの時退会してる人のバリデーション的な！？
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          validates :email, presence: true
          validates :last_name, presence: true
          validates :first_name, presence: true
          validates :last_name_kana, presence: true
          validates :first_name_kana, presence: true
          validates :zip_code, presence: true
          validates :address, presence: true
          validates :telephone_number, presence: true


end
