class StudentsController < ApplicationController
    wrap_parameters format: []

    def index
        students = Student.all
        render json: students
    end

    def create
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: { errors: [student.errors] }, status: :unprocessable_entity
        end
    end

    def show
        student = Student.find_by(id: params[:id])
        render json: student
    end

    def update
        student = Student.find_by(id: params[:id])
        student.update(student_params)
        if student.valid?
        render json: student, include: :instructor
        else
            render json: { errors: [student.errors] }, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end

    private 

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
