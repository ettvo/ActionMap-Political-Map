Given('there is a state {string} with symbol {string}') do |name, symbol|
  @state = State.create!(
    name: name,
    symbol: symbol,
    fips_code: 6,            
    is_territory: false,      
    lat_min: 32.5343,         
    lat_max: 42.0095,
    long_min: -124.4096,     
    long_max: -114.1308
  )
end

Given('the state has counties {string} and {string}') do |county1, county2|
  County.create!(name: county1, state: @state, fips_code: 37, fips_class: "H1")  # Example FIPS code and FIPS class for Los Angeles
  County.create!(name: county2, state: @state, fips_code: 75, fips_class: "H1")  # Example FIPS code and FIPS class for San Francisco
end


When('I make an AJAX request for counties with state symbol {string}') do |symbol|
  get counties_path(state_symbol: symbol)
end

When('I make an AJAX request for counties without a state symbol') do
  get counties_path
end

Then('the response should be successful') do
  expect(response).to be_successful
end

Then('the response should contain the counties {string} and {string}') do |county1, county2|
  counties = JSON.parse(response.body)
  expect(counties).to include(county1, county2)
end

Then('the response should contain an empty list of counties') do
  counties = JSON.parse(response.body)
  expect(counties).to be_empty
end

Then('the response should be a bad request') do
  expect(response).to have_http_status(:bad_request)
end

