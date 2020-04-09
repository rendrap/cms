class PagesController < ApplicationController

  layout 'admin'

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]

  def index
    logger.debug("*** Testing the logger ***")
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    # intantiate new object using form  para
    @page = Page.new(page_params)
    # Save the object
    if @page.save
      # redirect to index action
      flash[:notice] = "Page created successfully"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # Find a new object using form  para
    @page = Page.find(params[:id])
    # Update the object
    if @page.update_attributes(page_params)
      # redirect to show action
      flash[:notice] = "Page updated successfully"
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully"
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subject = Subject.sorted
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] =='create'
      @page_count += 1
    end
  end

end
