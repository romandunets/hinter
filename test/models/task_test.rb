require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "user@example.com", password: "password")
    @task = @user.tasks.build(title: "Update README.md", description: "Update README.md file", priority: 2, state: "In progress", deadline: DateTime.now + 7.days, user_id: @user.id)
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

end
