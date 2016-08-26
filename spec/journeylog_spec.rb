require 'journeylog'

describe Journeylog do

  let(:start_station) {double :start_station }
  let(:end_station) {double :end_station }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }
  subject { described_class.new(journey_class) }

  it 'should add an entry station to the current journey' do
    subject.start(start_station)
    expect(subject.current_journey).to include(:start_station => start_station)
  end

  it 'should add an exit station to the current journey' do
    subject.finish(end_station)
    expect(subject.current_journey).to include(:end_station => end_station)
  end

  it 'adds current journey to journeys' do
    subject.start(start_station)
    subject.finish(end_station)
    expect(subject.journeys).to include(subject.current_journey)
  end

  it 'creates a new journey with the entry station' do
    expect(journey_class).to receive(:new).with(start_station)
    subject.start(start_station)
  end

end
