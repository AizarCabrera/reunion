require 'minitest/autorun'
require 'minitest/emoji'
require './lib/activity'
require './lib/reunion'
require 'pry'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_attributes
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
    assert_equal [], reunion.activities
  end

  def test_it_can_add_activities
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)

    assert_equal [activity_1], reunion.activities
  end

  def test_it_can_add_participants_to_the_activities_of_reunion
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)

    assert_equal 60, reunion.total_cost
  end

end
