class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # Sign up user
  def create
    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
  end
end