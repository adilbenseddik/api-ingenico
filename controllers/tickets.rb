# curl -i -H "Content-Type: application/json" -X POST -d '{"aid":"xyz","date":"08/11/2015 12:30:05", "trader_name":"choupinou", "trader_address":"2 rue des choupinou", "client_name":"Somebody Dupont", "authorization_number":"xyu", "type_of_card":"visa", "tvr":"00000", "vat":"20", "amount":"100"}' http://localhost:4567/api/tickets

before do
  content_type :json
end

post '/api/tickets' do
  request.body.rewind
  params.merge!(JSON.parse(request.body.read))
  ticket = Ticket.create aid: params["aid"], date: DateTime.parse(params[:date]), trader_name: params[:trader_name], trader_address: params[:trader_address], client_name: params[:client_name], authorization_number: params[:authorization_number], type_of_card: params[:type_of_card], tvr: params[:tvr], vat: params[:vat].to_f, amount: params["amount"].to_f

  if ticket.valid?
    qrcode = RQRCode::QRCode.new("https://#{settings.servername}/api/tickets/#{ticket.id}")
    ticket.qrcode = Base64.strict_encode64(qrcode.as_png.to_blob)
    ticket.geo = Geokit::Geocoders::GoogleGeocoder.geocode(ticket.trader_address).ll
    map = GoogleStaticMap.new(:width => 250, :height => 150, :center => MapLocation.new(:address => ticket.trader_address))
    map.markers << MapMarker.new(:color => "red", :location => MapLocation.new(:address => ticket.trader_address))
    ticket.map = Base64.strict_encode64(map.get_map)
    ticket.url = "https://#{settings.servername}/api/tickets/#{ticket.id}"
    ticket.save
    status 201
    ticket.to_json
  else
    status 400
    {:errors => ticket.errors.full_messages}.to_json
  end
end

get '/api/tickets/:id' do |id|
  begin
    status 200
    Ticket.find(id).to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    {:errors => "record not found"}.to_json
  end
end
