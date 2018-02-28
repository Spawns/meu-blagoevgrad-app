class Frontend::PagesController < ApplicationController
  layout 'sidebar_layout'

    def transportation
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "transportation", :frontend_transportation_path, :options => { :title => "Transportation" }
      @page = Page.where(title: 'transportation').first
    end

    def visas
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "visas", :frontend_visa_path, :options => { :title => "Visa Information" }
      @page = Page.where(title: 'visas').first
    end

    def accommodation
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "accommodation", :frontend_accommodation_path, :options => { :title => "Accommodation" }
      @page = Page.where(title: 'accommodation').first
    end

end