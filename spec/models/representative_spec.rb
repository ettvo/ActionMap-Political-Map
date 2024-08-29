require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe '#civic_api_to_representative_params' do
    it 'handles existing representatives' do
      # Create an existing representative
      existing_rep = Representative.create!(
        name: "Existing Rep",
        ocd_id: "ocd-division/country:us/state:ca",
        title: "Senator"
      )

      # Mock the API response
      api_response = {
        'name' => "Existing Rep",
        'ocdId' => "ocd-division/country:us/state:ca",
        'officialPositions' => ["Senator"]
      }

      # Call the method
      result = Representative.civic_api_to_representative_params(api_response)

      # Assert that it returns the existing representative's ID
      expect(result).to eq(existing_rep.id)
    end
  end
end