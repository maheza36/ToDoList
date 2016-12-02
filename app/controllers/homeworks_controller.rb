class HomeworksController < ApplicationController
  def new
    @homework = Homework.new
    @homework.tasknotebooks.build
    binding.pry
    @notebooks = Notebook.where(user_id: current_user.id)
  end

  def show
    find_homework
    if @homework.nil?
      flash[:error] = "The homework does not work right now, please try later."
      redirect_to root_path
    end
  end

  def destroy
    find_homework
    if @homework.destroy
      flash[:success] = "Homework Destroyed Successfully"
    else
      flash[:error] = "We can not destroy the homework please tried later"
    end
    redirect_to homeworks_path
  end

  def edit
    find_homework
    @notebooks = Notebook.all
    if @homework.nil?
      flash[:error] = "We can not edit your homework."
      redirect_to root_path
    end
  end

  def update
    find_homework
    if @homework.update(homework_params)
      flash[:success] = "The Homework was updated. Ok"
      redirect_to homeworks_path
    else
      flash[:error] = "We have troubles to updated your homework."
      render 'edit'
    end
  end

  def create
    @homework = Homework.new(homework_params)
    if @homework.save
      @homework.tasknotebooks.build(notebook_id: params[:homework][:notebook_id])
      if @homework.save
        flash[:success] = "The new homework it was created with success."
        redirect_to homeworks_path
      end
    else
      @notebooks = Notebook.where(user_id: current_user.id)
      @homework.tasknotebooks.nil? ? @homework.tasknotebooks.build : nil
      flash[:error] = "Error...."
      render 'new'
    end
  end

  def index
    @homeworks = Homework.all
  end

  private

  def find_homework
    @homework = Homework.find_by(id: params[:id])
  end

  #strong parameters
  def homework_params
    params.require(:homework).permit(:name, :description, :date_create, :date_full, :priority, :taskfull)
  end
end
