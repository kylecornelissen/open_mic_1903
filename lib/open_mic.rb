class OpenMic
  attr_reader :arg,
              :performers
  def initialize(arg)
    @arg = arg
    @performers = []
  end

  def location
    @arg[:location]
  end

  def date
    @arg[:date]
  end

  def welcome(user)
    @performers << user
  end

end
