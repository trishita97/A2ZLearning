class ProfilesController < ApplicationController

  # before_action :authenticate_user!

  def show
      @user = User.find(params[:id])
      @tags = Tag.all()
  end

  def leaderboard
    @users = User.joins(:profile).order('profiles.score DESC')
    @tags = Tag.all()
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :middle_name, :last_name, :address, :mobile)
  end

end
