class NotebooksController < ApplicationController
  def new
    @notebook = Notebook.new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      flash[:success] = "Plane created. Ok"
      redirect_to root_path
    else
      @notebook = Notebook.all
      render 'new'
    end
  end

  def index
  end

private

def notebook_params
  params.require(:notebook).permit(:name, :user_id)
end

end
