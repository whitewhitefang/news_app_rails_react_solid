class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :source
      t.string :file_format

      t.timestamps
    end
  end
end
