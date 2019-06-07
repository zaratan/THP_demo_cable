# frozen_string_literal: true

class ClassroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @classrooms = current_user.classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    @attendances = @classroom.attendances.includes(:user)
  end
end
