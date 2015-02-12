class API::NotificationsController  < ApplicationController

  #before_filter :restrict_access, only: [:show, :update, :get_habitants, :destroy]
  respond_to :json

  def check
      send_lazy_user_notification
  end

  def send_lazy_user_notification
      # niet aanwezig dus notification maken
      house = House.find_by_id(params[:id]);

      house.users.each do |user|
          if !Task.where(:user_id => user.id, :house_id => params[:id]).present?

              message = "Beste,"+user.name+" je hebt nog geen taak uitgekozen, doe je ook mee?"

              notification = Notification.new(:house_id => params[:id], :user_id => user.id, :message => message)
              notification.save
          end
      end

      @notifications = Notification.where(:house_id => params[:id])

      render :json => @notifications

  end

end
