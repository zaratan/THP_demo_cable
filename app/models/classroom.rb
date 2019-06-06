# frozen_string_literal: true

# == Schema Information
#
# Table name: classrooms
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classroom < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
end
