class Application < ActiveRecord::Base

  #To reach the scope, you can use Application.denied, to return all denied applicants
  scope :submitted , -> {where(status: 'submitted')}
  scope :incomplete , -> {where(status: 'incomplete')}
  scope :accepted , -> {where(status: 'accepted')}
  scope :denied , -> {where(status: 'denied')}


before_save :default_values
 belongs_to :user
 has_one :passport  , :dependent => :destroy

  has_attached_file :photo, :styles => { :medium => "250x250", :thumb => "100x100" }, :default_url => ":style/missing.jpg"
   validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
   validates_attachment :photo , :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }, :size => { :in => 0..1000.kilobytes }

  accepts_nested_attributes_for :passport ,  :allow_destroy => true
  validates_acceptance_of :terms_of_service

  validates :motivational_letter, :previous_experience, :learned_from, :photo, :presence => true, :on => :update,  :if => :active_or_letters?
  validates_length_of :motivational_letter, :minimum => 200, :too_short => "Your motivational letter must be at least 200 words.", :tokenizer => lambda {|str| str.scan(/\w+/) }, :on => :update,  :if => :active_or_letters?
  validates :name, :dob, :gender, :mobile_phone, :current_address,:special_needs, :emergency_contact_person, :emergency_contact_person_phone, :terms_of_service, :presence => true, :on => :update, :if => :active_or_personal?
  validates :name,:special_needs, :emergency_contact_person, format: { with: /\A[a-zA-Z ]+\z/, message: "allows only letters" }, :on => :update, :if => :active_or_personal?
  validates :mobile_phone, :emergency_contact_person_phone, format: { with: /\d[0-9]\)*\z/, message: "allows only numbers" }, :on => :update, :if => :active_or_personal?
  validates :university, :field_of_studies, :on => :update, :presence => true, :if => :active_or_educational?
  validates :university, :field_of_studies, :on => :update, format: { with: /\A[a-zA-Z ]+\z/, message: "allows only letters" }, :if => :active_or_educational?
  validates :faction,  :presence => true, :on => :update,  :if => :active_or_delegate?

  def active?
    steps == 'incomplete'
  end
  def active_or_personal?
    self.steps.include?('personal') || active?
  end
  def active_or_delegate?
    self.steps.include?('delegate') || active?
  end
  def active_or_educational?
    self.steps.include?('educational') || active?
  end
  def active_or_letters?
    self.steps.include?('letters') || active?
  end

   def email
     self.user.email
   end


   #default values set on create
    def default_values
       self.special_needs ||= "None"
       self.status ||= "incomplete"
       self.preferred_state ||= "-"
    end
    #check attributes to see if the application is completed
    def check_attributes
     self.attributes.each do |attr_name , attr_value|
       if attr_value.blank? || attr_value.nil?
        return false
       end
     end
    end

    #submit application
    def submit
      self.update_attribute(:status , "submitted")
    end

     #incomplete application
    def incomplete
      self.update_attribute(:status , "incomplete")
    end

    #accept the applicant /admin only/
    def accept
      self.update_attribute(:status , "accepted")
      ApplicantMailer.acceptance_mail(self).deliver
    end
    #deny the application /admin only/
    def deny
      self.update_attribute(:status , "denied")
    end



end
