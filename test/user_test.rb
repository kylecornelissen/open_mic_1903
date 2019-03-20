require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

# pry(main)> joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
# # => #<Joke:0x00007fb71da169f0...>
#
# pry(main)> joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
# # => #<Joke:0x00007fb71d8e0bd0...>
#
# pry(main)> sal.learn(joke_1)
#
# pry(main)> sal.learn(joke_2)
#
# pry(main)> sal.jokes
# # => [#<Joke:0x00007fb71da169f0...>, #<Joke:0x00007fb71d8e0bd0...>]

class UserTest < Minitest::Test
  def test_if_user_class_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_if_name_attribute_exists
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_if_jokes_attribute_initialized_as_empty_array
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_if_learn_method_adds_jokes_to_jokes_array
    sal = User.new("Sal")

    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.learn(joke_1)
    sal.learn(joke_2)
    assert_equal [joke_1, joke_2], sal.jokes
  end

end
