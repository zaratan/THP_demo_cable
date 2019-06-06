# frozen_string_literal: true

class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
