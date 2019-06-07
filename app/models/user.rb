# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, dependent: :destroy
  has_many :classrooms, through: :attendances

  def connect(classroom:)
    attendance = attendances.find_by(classroom: classroom)
    attendance.update(status: :online)
    ClassroomChannel.broadcast_to(classroom, user: self, attendance: attendance)
  end

  def disconnect(classroom:)
    attendance = attendances.find_by(classroom: classroom)
    attendance.update(status: :offline)
    ClassroomChannel.broadcast_to(classroom, user: self, attendance: attendance)
  end
end
