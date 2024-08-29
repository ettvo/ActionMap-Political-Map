Given('## representatives ## exist:') do
  Representative.create!([
    { name: "Joseph R. Biden", ocdid: "ocd-division/country:us/state:de", title: "President" },
    { name: "Kamala D. Harris", ocdid: "ocd-division/country:us/state:ca", title: "Vice President" },
    { name: "Christopher A. Coons", ocdid: "ocd-division/country:us/state:de", title: "Senator" },
    { name: "Thomas R. Carper", ocdid: "ocd-division/country:us/state:de", title: "Senator" },
    { name: "Lisa Blunt Rochester", ocdid: "ocd-division/country:us/state:de", title: "Representative" },
    { name: "John Carney", ocdid: "ocd-division/country:us/state:de", title: "Governor" },
    { name: "Bethany Hall-Long", ocdid: "ocd-division/country:us/state:de", title: "Lieutenant Governor" },
    { name: "Trinidad Navarro", ocdid: "ocd-division/country:us/state:de", title: "Insurance Commissioner" },
    { name: "Kathy Jennings", ocdid: "ocd-division/country:us/state:de", title: "Attorney General" },
    { name: "Lydia E. York", ocdid: "ocd-division/country:us/state:de", title: "State Auditor" },
    { name: "Colleen C. Davis", ocdid: "ocd-division/country:us/state:de", title: "State Treasurer" },
    { name: "Matthew Meyer", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "County Executive" },
    { name: "Scott Phillips", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "County Council" },
    { name: "Ciro Poppiti III", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "Register of Wills" },
    { name: "Michael E. Kozikowski, Sr.", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "Recorder of Deeds" },
    { name: "Lisa Darrah", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "Clerk of the Peace" },
    { name: "Karen Hartley-Nagle", ocdid: "ocd-division/country:us/state:de/county:new_castle", title: "County Council President" },
    { name: "Brenda Wootten", ocdid: "ocd-division/country:us/state:de/county:kent", title: "County Council" },
    { name: "Norman R. Barlow", ocdid: "ocd-division/country:us/state:de/county:kent", title: "Sheriff" },
    { name: "Harold K. Brode", ocdid: "ocd-division/country:us/state:de/county:kent", title: "Treasurer" },
    { name: "Eugenia Thornton", ocdid: "ocd-division/country:us/state:de/county:kent", title: "Recorder of Deeds" },
    { name: "Terry L. Pepper", ocdid: "ocd-division/country:us/state:de/county:kent", title: "Clerk of the Peace" },
    { name: "Norman A. 'Jay' Jones, Jr.", ocdid: "ocd-division/country:us/state:de/county:sussex", title: "County Council" },
    { name: "Alexandra Reed Baker", ocdid: "ocd-division/country:us/state:de/county:sussex", title: "Register of Wills" },
    { name: "Greg Fuller", ocdid: "ocd-division/country:us/state:de/county:sussex", title: "Recorder of Deeds" },
    { name: "Robert Lee", ocdid: "ocd-division/country:us/state:de/county:sussex", title: "Clerk of the Peace" }
  ])
end

When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

When /^I press "(.*), (.*)"$/ do |location, state|
  states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

  if states.include?(location)
    visit(state_map_path(location.downcase.gsub(' ', '_')))
  else
    visit(county_path(state.downcase.gsub(' ', '_'), location.downcase.gsub(' ', '_')))
  end
end

When /^I search$/ do
  click_button("Search")
end 

When /^I follow "(.*)"$/ do |link|
  click_link(link)
end


Then /^I should (not )?see (only )?the following representatives: (.*)$/ do |no, only, rep_list|
  pending
end


Then /^debug$/ do
   require "byebug"; byebug
end

Then /^debug javascript$/ do
  page.driver.debugger
  1
end
