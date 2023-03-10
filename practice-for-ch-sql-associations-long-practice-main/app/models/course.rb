# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  instructor_id :bigint           not null
#  prereq_id     :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :student

    has_one :prereq,
        primary_key: :prereq_id,
        foreign_key: :id,
        class_name: :Course
        


end
