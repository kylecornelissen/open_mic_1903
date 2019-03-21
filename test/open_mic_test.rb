require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < Minitest::Test

  def test_open_mic_class_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_instance_of OpenMic, open_mic
  end

  def test_location_attribute_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "Comedy Works", open_mic.location
  end

  def test_date_attribute_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "11-20-18", open_mic.date
  end

  def test_performers_array_is_initialized_empty
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal [], open_mic.performers
  end

  def test_welcome_method_adds_users_to_performers_array
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    sal = User.new("Sal")
    ali = User.new("Ali")

    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal [sal, ali], open_mic.performers
  end

  def test_if_repeated_jokes_method_returns_false

    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    open_mic.performers
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    ali.learn(joke_1)
    ali.learn(joke_2)

    refute open_mic.repeated_jokes?
  end

  def test_if_repeated_jokes_method_returns_true
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    open_mic.performers
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    ali.learn(joke_1)
    ali.learn(joke_2)

    ali.tell(sal, joke_1)

    assert open_mic.repeated_jokes?
  end

end
