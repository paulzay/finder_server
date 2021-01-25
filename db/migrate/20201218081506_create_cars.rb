# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.text :description
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cars, %i[user_id created_at]
  end
end
