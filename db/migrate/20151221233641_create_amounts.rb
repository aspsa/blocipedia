class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.string :default
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
