class MainController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to dashboard_path
  	end
  end

  def about
  end

  def contact
  end

  def help
  end

  def dashboard
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @honored = Honored.where("user_id = ? AND status != ?", 
        current_user.id, "complete")

      @donation = Donation.where("user_id = ? AND created_at > ?",
        current_user.id, "#{30.days.ago}")

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
  end
end
