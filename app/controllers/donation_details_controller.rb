class DonationDetailsController < ApplicationController
  def new
    @honored = Honored.find(params[:honored_id])
    @donation_id = params[:donation_id]
    @honored_organization = HonoredOrganization.where("honored_id = ?", @honored.id)

    @organization_report = []
    @honored_organization.each do |honored_organization|
      @organization = Organization.find(honored_organization.organization_id)
      org_report = {organization_id: @organization.id, 
        organization_name: @organization.name}
      @organization_report.push(org_report)      
    end
    @donation_detail = DonationDetail.new
  end

  def create
      @donation_reciept_array = []
      @donation_total = 0
      params[:donation_detail].each do |key, value|        
        if key == "donation_id"
          @donation = Donation.find(value)
          DonationDetail.where("donation_id = ?", @donation.id)
        elsif key == "honored_id"
          @honored = Honored.find(value)
        elsif value[:amount].to_f > 0
          @donation_detail = DonationDetail.new
          @donation_detail.donation_id = @donation.id
          @donation_detail.organization_id = key
          @donation_detail.amount = value[:amount]
          @donation_detail.save
          @organization = Organization.find(@donation_detail.organization_id)

          donation_reciept = {organization_name: @organization.name,
            amount: @donation_detail.amount}
          @donation_reciept_array << donation_reciept
            
          @donation_total += @donation_detail.amount
        end
      end
   end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end