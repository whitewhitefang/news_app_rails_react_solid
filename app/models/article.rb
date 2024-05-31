class Article < ApplicationRecord


  private
  
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "header", "id", "id_value", "published", "updated_at"]
  end

end
