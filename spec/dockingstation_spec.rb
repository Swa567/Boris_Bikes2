require 'dockingstation'

describe DockingStation do
  it 'has an initialize method' do
    station = DockingStation.new
    expect(station).to be_an_instance_of(DockingStation)
  end

  it { is_expected.to respond_to :release_bike }

  it 'releases working bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'allows user to set the capacity' do
    bike = Bike.new
    station = DockingStation.new(50)
    expect(station.capacity).to eq 50
  end

  it 'has a capacity of 20 as default' do
    bike = Bike.new
    station = DockingStation.new
    expect(station.capacity).to eq 20
  end

  # it { is_expected.to respond_to(:bike) }

  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject).to respond_to(:bikes)
    # expect(subject.bike).to eq bike
  end

  it 'does not to release bikes when there are none available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'does not to accept more bikes than the capacity' do
    DockingStation::CAPACITY.times { subject.dock(Bike.new) }
    bike21 = Bike.new
    expect { subject.dock(bike21) }.to raise_error 'Docking Station is full'
  end

  # describe '#initialize method' do

  # end
end
