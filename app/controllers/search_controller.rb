# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

class SearchController < ApplicationController
  def search
    @address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new

    # service.key = Rails.application.credentials[:GOOGLE_API_KEY]
    service.key = Rails.application.credentials.dig(Rails.env.to_sym, :GOOGLE_API_KEY)

    begin
      result = service.representative_info_by_address(address: @address)
      @representatives = Representative.civic_api_to_representative_params(result)
    rescue Google::Apis::Error => e
      flash[:error] = "Error searching for representatives: #{e.message}"
      redirect_to root_path and return
    end
   render 'representatives/search'
  end
end
