# README

This README would normally document whatever steps are necessary to get the
application up and running.

Approach:

Model:
Course Model:
It has a has_many association with Tutor, indicating that a course can have multiple tutors.
Validation rules are specified using the validates method:
name, start_date, and end_date must be present.
code must be present and unique.
status must be present and can only be either "active" or "inactive".
price and max_capacity must be present and numerical, with a value greater than 0.
It uses accepts_nested_attributes_for :tutors to allow the creation of nested tutors within a course form.


Tutor Model:
It belongs to a Course, indicating that each tutor is associated with a single course.
Validation rules are specified similar to the Course model:
name, email, and phone must be present.
email must be unique and follow a valid email format.
status must be present and can only be either "active" or "inactive".

API's:

index: This method retrieves all courses along with their associated tutors and renders them as JSON. It utilizes includes(:tutors) to eager load the associated tutors, which helps to prevent N+1 queries. Then, it renders the courses as JSON, including only the specified attributes of the associated tutors (:name and :email). The response status is set to :ok indicating a successful request.

create: This method is responsible for creating a new course based on the parameters submitted through the request. It initializes a new Course object with the permitted parameters obtained from the course_params method. If the course saves successfully, it renders a JSON response including the created course and its associated tutors. If there are validation errors preventing the course from saving, it renders a JSON response containing the errors, along with a status of :unprocessable_entity.