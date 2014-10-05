class TenantResponsesController < ApplicationController

  before_action :validate_space

  def new
    @tenant_response = @space.tenant_responses.new
  end

  def create
    @tenant_response = @space.tenant_responses.new(tenant_responses_params)
    if verify_captcha_values and @tenant_response.save
      flash[:notice] = "Request sent to the owner"
      redirect_to @space
    else
      render :new
    end
  end

  #  ===================
  #  = Private Methods =
  #  ===================
  private

  def validate_space
    @space = Space.friendly.find(params[:space_id])
    redirect_to root_path unless @space.present?
  end

  def tenant_responses_params
    params.require(:tenant_response).permit(:email, :description)
  end
end
