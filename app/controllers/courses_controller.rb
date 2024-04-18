class CoursesController < ApplicationController
  def index
    render json: Course.all
  end

  def create
    course = Course.new(course_params)
    if course.save
      create_tutors(course)
      render json: { course: course, tutors: course.tutors }, status: :created
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :status, :code, :start_date, :end_date, :price, :max_capacity)
  end

  def tutor_params
    params.require(:tutors).map { |t| t.permit(:name, :email, :phone, :address, :experience, :specialization, :status) }
  end

  def create_tutors
    tutor_params.each do |tutor_param|
      course.tutors.create(tutor_param)
    end
  end
end
