class AddPassportIssueCityAndPassportIssueCountryToPassports < ActiveRecord::Migration
  def change
    remove_column :passports , :passport_issue 
    add_column :passports, :passport_issue_city, :string
    add_column :passports, :passport_issue_country, :string
  end
end
