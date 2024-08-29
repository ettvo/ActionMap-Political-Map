Feature: be able to find state-level, county-level reps via Representative search bar

As a random person from Delaware who doesn't watch the news, I don't know who my representatives are or what they stand for
I want to be able to search for the reps that rep my entire state, the reps that rep my specific county, and also the reps of neighboring counties to see if its any different

Background: representatives, their profiles, and the states have been added

Given ## representatives ## exist:

And I am on the Actionmap homepage

Scenario: click through the map to find the state representatives
	When I follow "Representatives"
  And I fill in "address-field" with 'Delaware'
	And I search
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Christopher A. Coons, Thomas R. Carper, Lisa Blunt Rochester, John Carney, Bethany Hall-Long, Trinidad Navarro, Kathy Jennings, Lydia E. York, Colleen C. Davis

Scenario: click through the map to find the county representatives
  When I follow "Representatives"
  And I fill in "address-field" with 'New Castle County, DE'
	And I search
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Christopher A. Coons, Thomas R. Carper, Lisa Blunt Rochester, John Carney, Bethany Hall-Long, Trinidad Navarro, Kathy Jennings, Lydia E. York, Colleen C. Davis, Matthew Meyer, Scott Phillips, Ciro Poppiti III, Michael E. Kozikowski, Sr., Lisa Darrah, Karen Hartley-Nagle

Scenario: click through the map to find the neighboring county representatives
  When I follow "Representatives"        
  And I fill in "address-field" with 'Kent County, DE'
	And I search
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Christopher A. Coons, Thomas R. Carper, Lisa Blunt Rochester, John Carney, Bethany Hall-Long, Trinidad Navarro, Kathy Jennings, Lydia E. York, Colleen C. Davis, Brenda Wootten, Norman R. Barlow, Harold K. Brode, Eugenia Thornton, Terry L. Pepper

Scenario: click through the map to find the neighboring county representatives
  When I follow "Representatives"       
  And I fill in "address-field" with 'Sussex County, DE'
	And I search
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Christopher A. Coons, Thomas R. Carper, Lisa Blunt Rochester, John Carney, Bethany Hall-Long, Trinidad Navarro, Kathy Jennings, Lydia E. York, Colleen C. Davis, Norman A. "Jay" Jones, Jr., Alexandra Reed Baker, Greg Fuller, Robert Lee
