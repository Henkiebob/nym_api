require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get lazy users" do

      #tasks = Task.all()
      #user  = User.find_by_id(users(:tjerk).id)

      # if user has a task, he's not lazy
     @users = Task.where(:user_id => users(:tjerk).id, :house_id => houses(:testhuis).id)

      if Task.where(:user_id => users(:tjerk).id, :house_id => houses(:testhuis).id).present?
          lazy = false
      else
          lazy = true
      end

      assert_equal(true, lazy, "user is not lazy while he should be")
      # assert_not_nil(user)
      # assert_not_nil(tasks)
  end

  test "get task that needs to be done" do

      #task = Task.where(:house_id => houses(:huisdertesten).id).order(:deadline).first

      time_to_check = Time.now
      p time_to_check
      task = Task.where("deadline <= ?", time_to_check).limit(1).order("deadline desc")

      p task

      assert_not_nil(task, "taak is leeg")
  end

end
