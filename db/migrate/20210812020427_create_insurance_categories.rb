class CreateInsuranceCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :insurance_categories do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
