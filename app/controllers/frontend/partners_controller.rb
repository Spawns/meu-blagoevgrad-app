class Frontend::PartnersController < ApplicationController
 add_breadcrumb "home", :root_path, :options => { :title => "Home" }
   def index
    add_breadcrumb 'Supporters', team_frontend_organizers_path , :options => { :title => 'Supporters'}
    @partners_general = Partner.where("role='sponsor'")
    @partners_media = Partner.where("role='partner'")
   end
end
