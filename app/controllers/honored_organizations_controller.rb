class HonoredOrganizationsController < ApplicationController
  def new
    @honored = Honored.find(params[:honored_id])
    organization_id = HonoredOrganization.where("honored_id = ?",
     params[:honored_id]).select(:organization_id).pluck(:id)
    
    if organization_id.empty?
      @organization = Organization.paginate(page: params[:page], :per_page => 30)
    else
      @organization = Organization.where("id NOT IN (?)", organization_id).
                                  paginate(page: params[:page], :per_page => 30)
    end
    
    @honored_organization = HonoredOrganization.new
  end

  def create    
    if params.has_key?(:id_checkbox) && !params[:id_checkbox].blank?  
      params[:id_checkbox].each do |check|
        if HonoredOrganization.where("organization_id = ?", check).
                               where("honored_id = ?", params[:honored_id]).
                               blank?
          @honored_organization = HonoredOrganization.new
          @honored_organization.honored_id = params[:honored_id]
          @honored_organization.organization_id = check
          @honored_organization.save
          @honored = Honored.find(params[:honored_id])
        end
      end  
    end

    @honored_organization = HonoredOrganization.where("honored_id = ?", params[:honored_id])

    @organization_names = []

    @honored_organization.each do |honored_organization|
      @organization = Organization.find(honored_organization.organization_id)
      @organization_names << @organization.name
    end
  end

  def update
  end

  def edit
  end

  def destroy
    HonoredOrganization.destroy(params[:id])
    redirect_to honored_organizations_path(honored_id: params[:honored_id])
  end

  def index
    @honored_organization_detail_array = []

    @honored = Honored.find(params[:honored_id])

    @honored_organization = HonoredOrganization.where("honored_id = ?", @honored.id)

    @honored_organization.each do |honored_organization|

      @organization = Organization.find(honored_organization.organization_id)
      
      @honored_organization_detail = { honored_organization: honored_organization.id, 
        organization_name: @organization.name }

      @honored_organization_detail_array.push(@honored_organization_detail)
    end
  end

  def show
  end
end
