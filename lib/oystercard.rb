require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :max_balance, :journeys, :current_journey

  DEFAULT_MAX = 90

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
    @current_journey = JourneyLog.new
  end

  def top_up(amount)
    fail "balance cannot exceed £#{DEFAULT_MAX}" if amount > DEFAULT_MAX - balance
    @balance += amount
  end

  def touch_in(station)
    fail "balance less than £#{Journey::MIN_FARE} - please top up" if balance < Journey::MIN_FARE
    #finish_journey if current_journey
    @current_journey.start(station)
  end

  def touch_out(station)
    @current_journey = Journey.new(exit_station: station) unless current_journey
    current_journey.finish(station)
    finish_journey
  end

  private

  def finish_journey
    @journeys << current_journey
    deduct(current_journey.fare)
    @current_journey = nil
  end

  def deduct(amount)
    @balance -= amount
  end

end
