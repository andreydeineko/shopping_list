class UsersController < Devise::RegistrationsController
  def create
    # Create the user from params
    @user = User.new(params[:user])
    if @user.save
      # Deliver the signup email
      Notifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end

  def generate_new_password_email
    user = User.find(params[:user_id])
    user.send_reset_password_instructions
    flash[:notice] = "Reset password instructions have been sent to #{user.email}."
    redirect_to admin_user_path(user)
  end
end