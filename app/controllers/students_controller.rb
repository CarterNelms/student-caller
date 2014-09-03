class StudentsController < ApplicationController
  def create
    @student = Student.new(student_params)
    is_new_student = @students.select{|s| s.name == @student.name}.length == 0

    if is_new_student
      if @student.save
        flash.notice = "#{@student.name} has been added to the list."
      else
        flash.alert = "#{@student.name} could not be added to the list."
      end
    else
      flash.alert = "#{@student.name} could not be added to the list."
    end
    redirect_to root_path
  end

  def update
    @student = Student.pick
    if @student
      flash.notice = "Call on #{@student.name}."
    else
      flash.alert = "All students have already been picked today."
    end
    redirect_to root_path
  end

  protected

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
