class NotebooksController < ApplicationController

  def new
    @notebook = Notebook.new
    respond_to do |format|
      format.html
      format.js do
        @modal = {
          modal_id: "new_notebook",
          modal_title: "New Notebook modal",
          modal_body: "form",
          modal_body_params: {form_name: params[:action].capitalize},
          modal_action: nil
        }
      end
    end
  end

  def show
    find_notebook
    if @notebook.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to notebooks_path
    end
  end

  def destroy
    find_notebook
    if @notebook.destroy
      flash[:success] = "Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to notebooks_path
  end

  def edit
    find_notebook
    if @notebook.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to notebooks_path
    end
  end

  def update
    find_notebook
    if @notebook.update(notebook_params)
      flash[:success] = "updated. Ok"
      redirect_to notebooks_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user = current_user
    if @notebook.save
      flash[:success] = "created. Ok"
      redirect_to notebooks_path
    else
      @notebook = Notebook.all
      render 'new'
    end
  end

  def index
    if !current_user
      @notebooks = Notebook.all
    else
      @notebooks = (Notebook.where(user_id: current_user.id) | Notebook.where.not(user_id: current_user.id))
    end
  end

private

def find_notebook
    @notebook = Notebook.find_by(id: params[:id])
end

def notebook_params
  params.require(:notebook).permit(:name)
end

end
