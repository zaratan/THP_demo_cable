# frozen_string_literal: true

class AddStatusToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :status, :integer, default: 0
  end
end
