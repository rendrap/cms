class SectionsController < ApplicationController

  layout 'admin'
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    # intantiate new object using form  para
    @section = Section.new(section_params)
    # Save the object
    if @section.save
      # redirect to index action
      flash[:notice] = "Section created successfully"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # Find a new object using form  para
    @section = Section.find(params[:id])
    # Update the object
    if @section.update_attributes(section_params)
      # redirect to show action
      flash[:notice] = "Section updated successfully"
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully"
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type,:content)
  end
end
