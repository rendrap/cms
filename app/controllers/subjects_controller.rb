class SubjectsController < ApplicationController

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # intantiate new object using form  para
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # redirect to index action
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update

  end

  def delete
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
