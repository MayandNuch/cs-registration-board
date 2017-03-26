class Teachers::RegistrationsController < Devise::RegistrationsController
  def create
    super #Nothing special here.
  end

  protected

  def sign_up(resource_name, resource)
    true
  end
end
