class InstructorsController < ApplicationController
    wrap_parameters format: []


    def index
        instructors = Instructor.all
        render json: instructors
    end

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update(instructor_params)
        if instructor.valid?
            render json: instructor, 
            else
                render json: { error: "Something went wrong" }, status: :unprocessable_entity
            end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy
        head :no_content
    end

    private 

    def instructor_params
        params.permit(:name)
    end
    
end
