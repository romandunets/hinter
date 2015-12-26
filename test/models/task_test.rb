require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "user@example.com", password: "password")
    @task = @user.tasks.create!(title: "Update README.md", description: "Update README.md file", priority: 2, state: "In progress", deadline: DateTime.now + 7.days, user_id: @user.id)
    @closest_task = @user.tasks.create!(title: "Add controller", description: "Add code for controller", priority: 2, state: "Open", deadline: DateTime.now + 1.days, user_id: @user.id)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end

  test "title should be present" do
    @task.title = " "
    assert_not @task.valid?
  end

  test "order should be by deadline" do
    assert_equal @closest_task, Task.first
  end

end
