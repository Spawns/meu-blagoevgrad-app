class ApplicationProcess::ApplicationsController < ApplicationController
before_filter :app_process_closed?
before_filter :authenticate_user!
before_filter :user_application
before_filter :application_submit_check

layout 'application'


include Wicked::Wizard

steps :personal, :educational , :passport , :delegate , :letters

  def create
    @application = current_user.build_application
    @application.user = current_user
    @application.save!
    redirect_to  wizard_path(steps.first)
  end


  def show
    @application = current_user.application
    case step
      when :passport
        @passport = @application.build_passport unless @application.passport
    end
    render_wizard
  end

  def update
    @application = current_user.application
    params[:application][:steps] = step.to_s
    params[:application][:steps] = 'active' if step == steps.last.to_s
    @application_saved = @application.update_attributes(permitted_params)
    render_wizard @application
  end

  def finish_wizard_path
    application_process_show_status_path
  end

  #show the current status of the application
  def show_status
    add_breadcrumb "home", :root_path, :options => { :title => "Home" }
    add_breadcrumb "view application" , application_process_application_path(current_user.application) , :options => { :title => "View Application" }
    @application = current_user.application
  end
  #submit a completed application
  def submit
   current_user.application.submit
  end

  def edit_application
    redirect_to wizard_path(steps.first)
  end

private
  #fallback method to create a current user application if the user does not have one
  def user_application
    if !current_user.application
        @application = current_user.build_application
        @application.user = current_user
        @application.save!
    end
  end

  def app_process_closed?
    unless AppConfig.applications_open?
      redirect_to process_closed_path
    end
  end
  #redirct the user if he has already submitted his/her application
  def application_submit_check
   if current_user.application && current_user.application.status == "submitted"
     redirect_to root_path
    end
  end

  def permitted_params
    params.require(:application).permit(:emergency_contact_person_phone, :tos, :photo , :name , :dob , :faction , :role , :preferred_state , :steps, :mobile_phone , :field_of_studies , :current_address ,  :emergency_contact_person ,  :special_needs , :university , :motivational_letter , :learned_from , :previous_experience,  :disclaimer , :gender, :terms_of_service ,  :passport_attributes => [:passport_issue_city , :passport_issue_country , :passport_no , :birth_city , :country , :nationality , :province])

  end


end


