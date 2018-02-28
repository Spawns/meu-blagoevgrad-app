class Passport < ActiveRecord::Base
  belongs_to :application
  before_save :default_values , :set_country_name
  validates :passport_no, :birth_city, :country, :nationality, :province, :passport_issue_city, :passport_issue_country, :presence => true, :on => :update,  :if => :active_or_passport?
  validates :passport_no, format: { with: /\d[0-9]\)*\z/, message: "allows only numbers" }, :on => :update,  :if => :active_or_passport?
  validates :birth_city, :country, :nationality, :province, :passport_issue_city, :passport_issue_country, format: { with: /\A[a-zA-Z ]+\z/, message: "allows only letters" }, :on => :update,  :if => :active_or_passport?

  def active?
    status == 'incomplete'
  end
  def active_or_passport?
    status.include?('passport') || active?
  end

  

  def check_attributes
     self.attributes.each do |attr_name , attr_value|
       if attr_value.blank? || attr_value.nil?
        return false
       end
      end
  end

  def set_country_name
    self.country_name = ISO3166::Country.new(self.country).name
  end


  def default_values
    self.status ||= "incomplete"
  end
end
