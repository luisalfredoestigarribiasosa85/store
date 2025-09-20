class Settings::ProfilesController < Settings::BaseController
  before_action :require_authentication

  def show
  end

  def update
    if Current.user.update(user_params)
      redirect_to settings_profile_path, status: :see_other, notice: "Profile updated!"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end