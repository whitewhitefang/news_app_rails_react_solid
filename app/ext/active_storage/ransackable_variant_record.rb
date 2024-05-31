module RansackableVariantRecord
  def ransackable_attributes(_auth_object = nil)
    %w[blob_id id id_value variation_digest]
  end

  def ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map {|a| a.name.to_s}
  end
end

ActiveSupport.on_load(:active_storage_blob) do
  ActiveStorage::VariantRecord.extend RansackableVariantRecord
end