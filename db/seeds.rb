
 #Don't create more than one app config!
 AppConfig.create(
     {
      keywords: 'MEU Blagoevgrad' ,
      description: 'annual MEU event',
      yt_url: 'youtube.com' ,
      tw_url: 'twitter.com' ,
      fb_url: 'facbook.com' ,
      conf_start: DateTime.new(2016 , 3 ,4),
      conf_end: DateTime.new(2016, 3 , 5)

     })
if !Admin.first

  Admin.create!({ email: 'admin@admin.bg' , password: '123123123' , password_confirmation: '123123123'})

end
 if Page.count == 0
  Page.create({title: 'transportation', content: '<p>No information yet. Come back later!</p>'})
  Page.create({title: 'visas', content: '<p>No information yet. Come back later!</p>'})
  Page.create({title: 'accommodation', content: '<p>No information yet. Come back later!</p>'})
 end

 if User.count <= 3
 user1 = User.create!  :email => 'john@gmail.com', :password => '123123123', :password_confirmation => '123123123'
 user2 = User.create!  :email => 'duchev@gmail.com', :password => '123123123', :password_confirmation => '123123123'
 user3 = User.create!  :email => 'pehi@gmail.com', :password => '123123123', :password_confirmation => '123123123'
end

 Application.create! :name => 'John Doe' , :dob => 'March 3, 1993', :gender => 'M' , :mobile_phone => '0352645' , :current_address => 'primaikati' , :university => 'ondastreet' , :field_of_studies => 'drugdealing' , :emergency_contact_person => 'Icaka' , :learned_from=> 'Other' , :previous_experience=>'none' , :motivational_letter=>'i want in niggaz' , :user_id=>1
 Passport.create! :birth_city=>'Yambol' , :country=>'Bulgaria' , :nationality => 'Bulgarian' , :province => 'Yambol' , :application_id =>1 ,:passport_issue_city =>'Yambol', :passport_issue_country => 'Bulgaria' , :passport_no => '3243252'

 Application.create! :name => 'John Doe' , :dob => 'March 3, 1993', :gender => 'M' , :mobile_phone => '0352645' , :current_address => 'primaikati' , :university => 'ondastreet' , :field_of_studies => 'drugdealing' , :emergency_contact_person => 'Icaka' , :learned_from=> 'Other' , :previous_experience=>'none' , :motivational_letter=>'i want in niggaz' , :user_id=>2
 Passport.create! :birth_city=>'Yambol' , :country=>'Bulgaria' , :nationality => 'Bulgarian' , :province => 'Yambol' , :application_id =>2 ,:passport_issue_city =>'Yambol', :passport_issue_country => 'Bulgaria' , :passport_no => '3243252'

 Application.create! :name => 'John Doe' , :dob => 'March 3, 1993', :gender => 'M' , :mobile_phone => '0352645' , :current_address => 'primaikati' , :university => 'ondastreet' , :field_of_studies => 'drugdealing' , :emergency_contact_person => 'Icaka' , :learned_from=> 'Other' , :previous_experience=>'none' , :motivational_letter=>'i want in niggaz' , :user_id=>3
 Passport.create! :birth_city=>'Yambol' , :country=>'Bulgaria' , :nationality => 'Bulgarian' , :province => 'Yambol' , :application_id =>3 ,:passport_issue_city =>'Yambol', :passport_issue_country => 'Bulgaria' , :passport_no => '3243252'