class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

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
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form  para
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # redirect to show action
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
