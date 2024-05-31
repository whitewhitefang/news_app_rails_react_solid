class Image < ApplicationRecord  


  private
  
  def self.ransackable_attributes(auth_object = nil)
    ["title", "created_at", "source", "id", "file_format", "updated_at"]
  end
end
