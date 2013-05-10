class DonationsController < ApplicationController
  def new
    if !user_signed_in?
      flash[:notice] = "Please sign in to continue."
      redirect_to new_user_session_path
    elsif params[:honored_id].blank?
      flash[:notice] = "Please select a honored to continue with donation."
      redirect_to honoreds_path 
    else
      if !Honored.find_by_id(params[:honored_id]).blank? 
        @honored = Honored.find(params[:honored_id])
      else
        flash[:notice] = "The honored you selected was not found."
        redirect_to honoreds_path
      end
    end
  end

  def create
    if !params[:honored_id].blank?
      @donation = Donation.new
      if !Honored.find_by_id(params[:honored_id]).blank?
        @honored = Honored.find(params[:honored_id])
        @donation.honored_id = @honored.id
        @donation.user_id = current_user.id
        if @donation.save
          redirect_to new_donation_detail_path(honored_id: @honored.id, donation_id: @donation.id)
        else
          flash[:notice] = "An error occured createing a donation for honored.
            Sorry for the inconvience."
          redirect_to honored_path(@honored.id)
        end
      else
        flash[:notice] = "The honored you selected was not found."
        redirect_to honoreds_path        
      end
    else
      flash[:notice] = "Please select a honored to continue with donation."
      redirect_to honoreds_path
    end    
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @donation = Donation.all
    @donation_reciept_array = []

    if !@donation.blank?
      @donation.each do |donation|
        @donation_detail  = DonationDetail.where("donation_id = ?", donation.id)
        if !@donation_detail.blank?
          @donation_honored = Honored.find(donation.honored_id)
        
          honored_name = @donation_honored.first_name + " " + @donation_honored.last_name
        
          donation_reciept = {donation_id: donation.id,
            honored_name: honored_name, 
            donation_date: donation.created_at.to_time.strftime('%B %A %Y') }

          @donation_reciept_array << donation_reciept
        end
      end
    end
  end

  def show
    if params[:id].blank?      
      redirect_to dashboard_path
    end

    @donation = Donation.find(params[:id])

    if @donation.blank?
      redirect_to dashboard_path
    end
    @user = User.find(@donation.user_id)

    @donation_detail = DonationDetail.where("donation_id = ?", "#{@donation.id}")

    if @donation_detail.blank?
      flash[:notice] = "Donation number " + 
        @donation.id + " does not contain donation information"

      redirect_to donations_path
    end

    @donation_total = 0
    @donation_reciept_array = []

    @donation_detail.each do |detail|
        @organization = Organization.find(detail.organization_id)

        donation_reciept = {
          organization_name: @organization.name,
          amount: detail.amount
        }

        @donation_reciept_array << donation_reciept        
            
        @donation_total += detail.amount
    end
  end
end
