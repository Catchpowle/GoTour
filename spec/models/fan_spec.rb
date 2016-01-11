describe 'Gelocation' do
  before do
    Geocoder::Lookup::Test.add_stub(
      "London, UK", [
        {
          'latitude'     => 51.5073509,
          'longitude'    => -0.1277583,
          'address'      => 'London, UK',
          'state'        => 'London',
          'state_code'   => '',
          'country'      => 'UK',
          'country_code' => 'UK'
        }
      ]
    )
    @fan = Fan.create!(email: 'jon@email.com', name: 'Jon Catchpowle', city: 'London',
     country: 'UK', password: 'password', password_confirmation: 'password')   
  end

  it "builds a string suitable for geocoding" do
    expect(@fan.geocode_string).to eq('London, UK')
  end

  it "geocodes the co-ordinates" do
    @fan.geocode

    expect(@fan.latitude).to eq(51.5073509)
    expect(@fan.longitude).to eq(-0.1277583)
  end

  it "geocodes on save" do
    @fan.save!
    expect(@fan.latitude).to eq(51.5073509)
    expect(@fan.longitude).to eq(-0.1277583)
  end
end
