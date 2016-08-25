require 'journey_log'

describe JourneyLog do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey_class) { double :journey_class, new: journey }
  let(:journey) { double(:journey, finish: { :entry_station => entry_station, :exit_station => exit_station })}

  it 'should be able to receive the start method' do
    subject.start(entry_station)
    expect(subject.instance_variable_get(:@current_journey)).not_to eq nil
  end

=begin
  it "should store the incomplete journey" do
    expect(subject.journeys).to be_include(current_journey)
  end
=end

  it 'should receive a finished journey' do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.instance_variable_get(:@current_journey)).to include(:entry_station => entry_station, :exit_station => exit_station)
  end

end
