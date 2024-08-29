# frozen_string_literal: true

# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_office = rep_info.offices.find { |office| office.official_indices.include?(index) }
      
      params = {
        name: official.name,
        ocdid: ocdid_office&.division_id,
        title: ocdid_office&.name,
        party: official.party,
        photo_url: official.photo_url,
        street: official.address&.first&.line1,
        city: official.address&.first&.city,
        state: official.address&.first&.state,
        zip: official.address&.first&.zip
      }

      existing_rep = Representative.find_by(name: official.name, ocdid: ocdid_office&.division_id)
      if existing_rep
        existing_rep.update(params)
        rep = existing_rep
      else
        rep = Representative.create!(params)
      end
      reps << rep
      # need to check if representative is already in database
      #unless Representative.exists?(name: official.name, ocdid: ocdid_temp,
      #    title: title_temp)
      #		rep = Representative.create!({ name: official.name, ocdid: ocdid_temp, title: title_temp })
      #		reps.push(rep)
	    # end 
    end

    reps
  end
end