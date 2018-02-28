class AppConfig < ActiveRecord::Base
  
   #make sure that there is only one entry
   def self.single_entry
     if !self.first.nil?
      return true
     end
   end


 #get keywords for meta_keywords
  def self.keywords
    self.first.keywords unless self.first.nil?
  end
 #get description for meta_description
  def self.description
    self.first.description unless self.first.nil?
  end
  #get conference start date
  def self.conf_start
    self.first.conf_start unless self.first.nil?
  end
  #get conference twitter URL
  def self.tw_url
    "https://twitter.com/#{self.first.tw_url}"
  end
  #get facebook URL
  def self.fb_url
     "https://www.facebook.com/#{self.first.fb_url}"
  end
  #get YouTube URL
  def self.yt_url
     "https://www.youtube.com/#{self.first.yt_url}"
  end
  #get Instagram URL
   def self.in_url
     "https://instagram.com/#{self.first.in_url}"
   end
  #get the terms of service for the application process
  def self.tos
    self.first.tos
  end
  #check if the application process is open
  def self.applications_open?
    self.first.app_process
  end
  #start the app process
  def self.start_process
    self.first.update_attribute(:app_process , true)
  end

  #stop the app process
  def self.stop_process
    self.first.update_attribute(:app_process , false)
  end
end
