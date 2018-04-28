require 'sinatra'
require './block'

aaaaaa = Blockchain.new

get '/' do 

	message = "<center>"

	aaaaaa.all_blocks.each do |b|
	message<<"번호 : " + b['index'].to_s + "<br>"
	message<<"시간 : " + b['time'].to_s + "<br>"
	message<<"Nonce : " + b['nonce'].to_s + "<br>"
	message<<"앞 주소 : " + b['previous_address'].to_s + "<br>"
	message<<"내 주소 : " + Digest::SHA256.hexdigest(b.to_s) + "<br>"
	message<< "<hr>"
end

message + "<center>"

end


get '/mine' do
	aaaaaa.mining.to_s
	end


