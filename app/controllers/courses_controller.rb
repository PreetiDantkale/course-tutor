class CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors).all
    render json: courses, include: { tutors: { only: [:name, :email] } }, status: :ok
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: { course: course, tutors: course.tutors }, status: :created
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :status, :code, :start_date, :end_date, :price, :max_capacity,
      tutors_attributes: [:name, :email, :phone, :address, :experience, :specialization, :status, :_destroy])
  end
end
