class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :source
      t.string :area
      t.integer :stock, default: 0
      t.text :flavor

      t.timestamps
    end
  end
end
