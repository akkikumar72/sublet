module TenantResponsesHelper

  def tenant_response_description(tenant_response, space)
    if tenant_response.description.blank?
      "I found your sublease listing for #{space.title} and wanted to schedule a tour."
    else
      tenant_response.description
    end
  end
end
