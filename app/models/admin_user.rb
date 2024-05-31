class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable


  private

  def self.ransackable_attributes(auth_object = nil)
    ["email", "created_at", "password", "id", "updated_at", "password_confirmation"]
  end

end
