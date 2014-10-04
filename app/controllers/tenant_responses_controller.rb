class TenantResponsesController < ApplicationController

  before_action :validate_space

  def new
    @tenant_response = @space.tenant_responses.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @tenant_response = @space.tenant_responses.new(tenant_responses_params)
    respond_to do |format|
      if @tenant_response.save
        format.js
        format.html {redirect_to root_path, notice: "Your message successfully sent to space owner" }
      else
        format.js {render :new}
        format.html {render :new}
      end
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
