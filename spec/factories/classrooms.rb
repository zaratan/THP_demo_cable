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

FactoryBot.define do
  factory :classroom do
    title { "MyString" }
    description { "MyText" }
  end
end
