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
	message<<"거래 : " + b['transaction'].to_s + "<br>"
	message<< "<hr>"
end

message + "<center>"

end


get '/mine' do
	aaaaaa.mining.to_s
	end

get '/transaction' do
	"보내는사람 : " + params["sender"] + "<br>" + "받는사람 :" + params["receiver"]
	aaaaaa.trans(params["sender"], params["receiver"], params["amount"])
 end


get '/new_wallet' do
	aaaaaa.make_a_wallet.to_s
	"지갑이 생성되었습니다."

end

	get '/all_wallet' do
		aaaaaa.show_all_wallet.to_s
end
