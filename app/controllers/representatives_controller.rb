# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def search
    address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    # service.key = Rails.application.credentials.google[:GOOGLE_API_KEY]
    service.key = Rails.application.credentials.dig(Rails.env.to_sym, :GOOGLE_API_KEY)

    begin
      result = service.representative_info_by_address(address: address)
      @representatives = Representative.civic_api_to_representative_params(result)
      render 'search'
    rescue Google::Apis::Error => e
      flash[:error] = "Error searching for representatives: #{e.message}"
      redirect_to representatives_path
    end
  end

  def index
    @representatives = Representative.all
  end

  def show
    @representative = Representative.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Handle the case where the record does not exist
    redirect_to root_url, alert: 'Representative not found.'
  end

end