class Frontend::ConferenceDocumentsController < ApplicationController
  layout 'sidebar_layout'
   def index
     @documents = ConferenceDocument.all
      add_breadcrumb "Home" , :root_path
      add_breadcrumb 'Conference Documents', frontend_conference_documents_path, :options => { :title => 'Agenda'}
   end
end
