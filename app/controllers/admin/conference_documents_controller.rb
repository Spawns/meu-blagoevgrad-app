class Admin::ConferenceDocumentsController < Admin::ApplicationController
  before_action :authenticate_admin!
  layout 'configuration'
  skip_before_filter :verify_authenticity_token, :only => :create

  before_filter :set_document , only: [:edit , :update , :destroy]
  before_filter :all_documents, only: [:index , :create, :update , :destroy]

  layout  proc {|controller| controller.request.xhr? ? false: 'configuration'}

   def index

   end



  def new
    @document = ConferenceDocument.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @document = ConferenceDocument.new(doc_params)

    respond_to do |format|
      if @document.save
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @document.destroy

    respond_to do |format|
      format.js
    end
  end


  private
  def set_document
    @document = ConferenceDocument.find(params[:id])
  end


  def doc_params
    params.require(:conference_document).permit( :name , :description , :document)

  end
  def all_documents
    @documents = ConferenceDocument.all
  end


end
