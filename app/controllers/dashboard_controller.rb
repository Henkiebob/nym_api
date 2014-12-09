class DashboardController < ApplicationController

  before_filter :logged_in!

  # def session_select
  #     house_id = session["house_id"];

  #     if house_id
  #       @users = House.find_by_id(house_id).users
  #     else
  #       redirect_to new_session_path
  #     end
  # end

  def set_user_session
       session[:user_id] = params[:id];
       redirect_to dashboard_index_path
  end

  def unset_user_session
      session.delete(:user_id)
      redirect_to dashboard_index_path
  end

  # def check_session
  #     if !session[:user_id].blank?
  #       redirect_to session_select_path
  #     end
  # end

  def index
    if session["current_house_id"];
      @user = User.find_by_id(session[:user_id])
      @users = House.find_by_id(session[:current_house_id]).users
    end
  end

end
