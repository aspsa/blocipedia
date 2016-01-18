class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :user
      t.references :wiki

      t.timestamps null: false
    end
  end
end