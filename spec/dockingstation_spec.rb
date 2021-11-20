require 'dockingstation'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double(:bike, broken?: false, working?: true)
    # fix error: Failure/Error: raise 'Can not release a broken bike' if bike.broken
    #<Double :bike> received unexpected message :broken with (no args)
    allow(bike).to receive_messages(broken: false)
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'does not release broken bikes' do
    # see how we move the allow() statement
    # into the double creation statement
    bike = double(:bike, broken?: true, working?: false)
    # fix error message : expected Exception with "Can not release a broken bike",
    # got #<RSpec::Mocks::MockExpectationError:
    #<Double :bike> received unexpected message :broken with (no args)> with backtrace:
    allow(bike).to receive_messages(broken: true)
    subject.dock bike
    expect {subject.release_bike}.to raise_error 'Can not release a broken bike'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'does not to release bikes when there are none available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'does not to accept more bikes than the capacity' do
      DockingStation::CAPACITY.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike)) }.to raise_error 'Docking Station is full'
    end
  end
  
  ### EXTRA SPEC WHICH PASSED THE TEST BUT ARE NOT IN THE WALKTHROUGH
  # it 'has an initialize method' do
  #   station = DockingStation.new
  #   expect(station).to be_an_instance_of(DockingStation)
  # end

  # it 'allows user to set the capacity' do
  #   station = DockingStation.new(50)
  #   expect(station.capacity).to eq 50
  # end

  # it 'has a capacity of 20 as default' do
  #   station = DockingStation.new
  #   expect(station.capacity).to eq 20
  # end

  # it 'returns docked bikes' do
  #   subject.dock(double(:bike))
  #   expect(subject).to respond_to(:bikes)
  # end

  # it "acknowledge a broken bike when it's docked" do
  #   expect(subject).to respond_to(:report_broken).with(1).argument
  # end

end
