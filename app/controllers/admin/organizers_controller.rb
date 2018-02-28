class Admin::OrganizersController < Admin::ApplicationController
  before_action :authenticate_admin!
  layout 'configuration'
  before_filter :set_organizer, only: [:edit , :update , :destroy]
  before_filter :all_organizers , only: [:index , :create, :update , :destroy]
  layout  proc {|controller| controller.request.xhr? ? false: 'configuration'}

  def index
    if params[:team_page]
      @active = 'team'
    elsif params[:adviser_page]
      @active = 'adviser'
    elsif params[:chair_page]
      @active = 'chair'
    else
      @active = 'team'
    end
  end

  def new
    @organizer = Organizer.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.js
      else
        format.js
      end
    end
  end

  def show
    @organizer = Organizer.find(params[:id])
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @organizer.update_attributes(organizer_params)
        format.js
      else
        format.js
        end
    end
  end


  def destroy
    @organizer.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def all_organizers
    @team_organizers = Organizer.where("role = :role" ,  role: 'team').paginate(page: params[:team_page], :per_page => 3).order('created_at DESC')
    @adviser_organizers = Organizer.where("role = :role" ,  role: 'adviser').paginate(page: params[:adviser_page], :per_page => 3).order('created_at DESC')
    @chair_organizers = Organizer.where("role = :role" ,  role: 'chair').paginate(page: params[:chair_page], :per_page => 3).order('created_at DESC')
  end

  def set_organizer
    @organizer = Organizer.find(params[:id])
  end
  def organizer_params
    params.require(:organizer).permit(:name , :bio  , :title , :role , :avatar)
  end

end