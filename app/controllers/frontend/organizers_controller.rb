class Frontend::OrganizersController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Home" }
  layout proc{|controller| controller.request.xhr? ? false : 'sidebar_layout'}
  def team
    add_breadcrumb 'Organizing team', team_frontend_organizers_path , :options => { :title => 'Organizing team'}
    @organizers = Organizer.where("role='team' ").order("updated_at DESC")
    @title = "Organizing team"
    render :index
  end

  def advisers
    add_breadcrumb 'Advisers', advisers_frontend_organizers_path , :options => { :title => 'Advisers'}
    @organizers = Organizer.where("role='adviser' ")
    @title = "Advisers"
    render :index
  end


  def chairs
    add_breadcrumb 'Chairs', chairs_frontend_organizers_path , :options => { :title => 'Chairs'}
    @organizers = Organizer.where("role='chair' ")
    @title = "Chairs"
    render :index
  end

 def show
  @organizer = Organizer.find(params[:id])
 
  respond_to do |format|
    format.js
  end
end


end
