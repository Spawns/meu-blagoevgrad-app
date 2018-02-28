class Organizer < ActiveRecord::Base
 validates :name , presence: true
 validates :bio , presence: true
 validates :title , presence: true
 validates_inclusion_of :role  , :in => %w( adviser chair team ), :message => "has to be either advisor,chair or team."
   has_attached_file :avatar, :styles => { :medium => "224x224>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
