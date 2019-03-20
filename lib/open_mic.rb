class OpenMic

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

end
