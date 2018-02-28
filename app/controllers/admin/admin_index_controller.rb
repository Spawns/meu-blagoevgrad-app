class Admin::AdminIndexController < Admin::ApplicationController
  before_action :authenticate_admin!
  layout 'configuration'

  def index
    @accepted_passports = Application.where(status: 'accepted').joins(:passport)
  end
end