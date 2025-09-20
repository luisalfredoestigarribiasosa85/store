class Settings::PasswordsController < Settings::BaseController
  before_action :require_authentication

  def show
  end

    def update
    if Current.user.update(password_params)
      redirect_to root_path, status: :see_other, notice: "Your password has been updated."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    def password_params
      params.expect(user: [ :password, :password_confirmation, :password_challenge ]).with_defaults(password_challenge: "")
    end
end