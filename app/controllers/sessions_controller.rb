class SessionsController < Devise::SessionsController
  # GET /resource/sign_out
  def destroy
    cookies[:favourite_voyage_ids] = nil
    cookies[:favourite_ship_ids] = nil
    super
  end
end