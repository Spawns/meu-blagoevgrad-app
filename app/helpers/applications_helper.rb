module ApplicationsHelper
  def application_complete?
    case true
      when (["submitted", "accepted", "denied"].include? current_user.application.status)
        content_tag(:a  , :class=>'success-status',:href=> '#') {
          content_tag(:span, "Submitted  ") +
          content_tag(:i , :class=> 'fi-check'){}
        }
      when check_for_incomplete
        content_tag(:a, :class=>'submit-status', :href => application_process_show_status_path ) {
          content_tag(:span, "Submit now  ") +
          content_tag(:i , :class=> 'fi-upload'){}
        }
      else
        content_tag(:a , :class=>'incomplete-status', :href=> application_process_show_status_path) {
          content_tag(:span, "Incomplete  ") +
          content_tag(:i , :class=> 'fi-x'){}
        }
    end
  end

  def check_input(attribute)
   if !attribute.nil? || !attribute.blank?
     attribute
   else
     content_tag(:span , :class => "missing") { 'MISSING' }
   end
  end

  def preferred_state(f)
    f.select :preferred_state, region_options_for_select(only_us_and_canada) 
  end

  def application_check
     current_user.application.check_attributes && current_user.application.passport.check_attributes
  end

  #RETURN only countries form the EU
  def only_us_and_canada
    Carmen::Country.all.select{|c| %w{BG BE CZ DK DE EE IE EL ES FR HR IT CY LV LT LU HU MT NL AT PL PT RO SI SK FI SE UK}.include?(c.code)}
  end

   def check_for_incomplete
    if application_check then true else false end
   end



end
