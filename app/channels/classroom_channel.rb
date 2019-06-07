# frozen_string_literal: true

class ClassroomChannel < ApplicationCable::Channel
  def subscribed
    @classroom = Classroom.find(params[:classroom_id])
    stream_for @classroom
    current_user.connect(classroom: @classroom)
  end

  def unsubscribed
    current_user.disconnect(classroom: @classroom)
  end
end
