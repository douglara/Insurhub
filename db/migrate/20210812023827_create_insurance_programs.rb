class CreateInsurancePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :insurance_programs do |t|
      t.string :name
      t.text :description
      t.references :insurance_category, null: false, foreign_key: true
      t.string :link_url
      t.string :image_url

      t.timestamps
    end
  end
end
