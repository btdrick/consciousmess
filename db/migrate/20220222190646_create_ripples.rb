class CreateRipples < ActiveRecord::Migration[6.1]
  def change
    create_table :ripples do |t|
      t.string :author, null: false
      t.string :website
      t.text :message, null: false

      t.timestamps
    end
  end
end
