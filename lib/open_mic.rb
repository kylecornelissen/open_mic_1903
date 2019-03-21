class OpenMic
  attr_reader :performers,
              :location,
              :date

  def initialize(openmic_info)
    @location   = openmic_info[:location]
    @date       = openmic_info[:date]
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    total_jokes = []

    @performers.each do |performer|
      performer.jokes.each do |joke|
        total_jokes << joke
      end
    end
    total_jokes.length != total_jokes.uniq.length
  end

end
