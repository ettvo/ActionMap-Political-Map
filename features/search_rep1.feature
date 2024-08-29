Feature: search for representatives for CA by clicking through the map or by search bar in "Representatives"

	As a random Californian from San Francisco who doesn't watch the news, I don't know who my representatives are or what they stand for
	Once I know them, I want to be able to search for them individually to learn more

Background: representatives, their profiles, and the states have been added

Given ## representatives ## exist:

And I am on the Actionmap homepage

Scenario: click through the map to find the county representatives
	When I press "California, CA"
	When I press "San Francisco County, CA"
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Alex Padilla, Laphonza R. Butler, Gavin Newsom, Eleni Kounalakis, Tony Thurmond, Ricardo Lara, Rob Bonta, Malia M. Cohen, Shirley N. Weber, Fiona Ma, Carol A. Corrigan, Goodwin H. Liu, Joshua P. Groban, Kelli Evans, Leondra R. Kruger, Martin J. Jenkins, Patricia Guerrero, London Breed, Joaquín Torres, Brooke Jenkins, Paul M. Miyamoto, Manohar Raju, José Cisneros, David Chiu

Scenario: use the Representatives search bar to find representatives
	When I follow "Representatives"
	And I fill in "address-field" with 'San Francisco'
	When I search
	Then I should see only the following representatives: Joseph R. Biden, Kamala D. Harris, Alex Padilla, Laphonza R. Butler, Gavin Newsom, Eleni Kounalakis, Tony Thurmond, Ricardo Lara, Rob Bonta, Malia M. Cohen, Shirley N. Weber, Fiona Ma, Carol A. Corrigan, Goodwin H. Liu, Joshua P. Groban, Kelli Evans, Leondra R. Kruger, Martin J. Jenkins, Patricia Guerrero, London Breed, Joaquín Torres, Brooke Jenkins, Paul M. Miyamoto, Manohar Raju, José Cisneros, David Chiu
