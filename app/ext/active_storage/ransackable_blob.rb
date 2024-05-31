module RansackableBlob
  def ransackable_attributes(_auth_object = nil)
    %w[id key filename content_type metadata service_name byte_size checksum created_at]
  end

  def ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map {|a| a.name.to_s}
  end
end

ActiveSupport.on_load(:active_storage_blob) do
  ActiveStorage::Blob.extend RansackableBlob
end