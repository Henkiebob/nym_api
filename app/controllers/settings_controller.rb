class SettingsController < ApplicationController

    def index
        house_id = session["current_house_id"];
        @users = House.find_by_id(house_id).users
    end

end
