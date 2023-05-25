require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "Sean.davis1289", users(:sean).name
  end
end
