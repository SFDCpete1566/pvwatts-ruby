require_relative '../../spec_helper'
 
describe PVWatts::System do
 
  describe "default attributes" do
 
    it "includes httparty methods" do
      expect(PVWatts::System).to include(HTTParty)
    end
 
    it "has the base url set to the PV-Watts endpoint" do
      expect(PVWatts::System.base_uri).to eq('http://api/pvwatts/v4')
    end
 
  end

  describe "GET system profile" do

  	let(:system) { PVWatts::System.new }
 
	  before(:each) do
	    VCR.insert_cassette 'system', :record => :new_episodes
	  end
	 
	  after(:each) do
	    VCR.eject_cassette
	  end
	 
	  it "records the fixture" do
	    PVWatts::System.get('/api/pvwatts/v4.json?api_key=E5VcxKj2Cv0sksDurt5wIXpSCAAgsYvm3WYgHBcj&system_size=4&dataset=tmy2&derate=0.77&lat=40&lon=-105')
	  end

	  it "has a profile method" do
	    expect(System).to respond_to(:profile)
	  end
	 
	  it "parses the api response from JSON to Hash" do
	    expect(system.profile).to be_instance_of(Hash)
	  end
	 
	  it "performs the request and gets the data" do
	    expect(system.profile["system_size"]).to eq('4')
	  end
  end

	describe "dynamic attributes" do
	 
	  before(:each) do
	    system.profile
	  end
	 
	  it "return the attribute value if present in profile" do
	    expect(system.profile).to eq(1)
	  end
	 
	  it "must raise method missing if attribute is not present" do
	    expect(lambda { system.foo_attribute }).to raise(NoMethodError)
	  end
	 
	end
 
end