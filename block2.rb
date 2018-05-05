require 'securerandom'

class Blockchain


def initialize
	@chain = []
	@transaction = []
	@wallet = {}
end

def make_a_wallet
new_wallet_address = SecureRandom.uuid
@wallet[new_wallet_address] = 1000
@wallet
	end


def trans(s, r, a)
	if @wallet[s].nil?
		"없는 지갑입니다."

	elsif @wallet[r].nil?
		"없는 지갑입니다."
	
	elsif @wallet[s].to_f < a.to_f
		"잔액이 부족합니다."
	else

	t = {
		"sender" => s,
		"receiver" => r,
		"amount" => a
	}
	@wallet[r] = @wallet[r] + a.to_f
	@wallet[s] = @wallet[s] - a.to_f
	@transaction << t
"거래완료"
end

end

def mining
	history = []
	current_time = Time.now.to_f
begin
	nonce = rand(1000000)
	history << nonce
	hashed = Digest::SHA256.hexdigest(nonce.to_s)
end while hashed[0..3] != '0000'
Time.now.to_f - current_time

nonce

block = {
"index" => @chain.size + 1,
"time" => Time.now,
"nonce" => nonce,
"previous_address" => Digest::SHA256.hexdigest(last_block.to_s),
"transaction" => @transaction
}

@transaction = []
@chain << block
block
end

def all_blocks
	@chain
end

def last_block
	@chain[-1]
end

def show_all_wallet
	@wallet
end

def ask_other_block
	@node.each do |n|
	 other_block = HTTParty.get("http://localhost:" + n + "/number_of_blocks").body

	 if @chain.size < other_block.to_i
	 	jsoned_chain = @chain.to_json
	 	HTTParty.get("http://localhost:" + n + "/recv?blocks=" + jsoned_chain)
	 	@chain = []
	 end
	 end

end

def add_node(node)
	@node << node
	@node.uniq!
	@node
end

def recv(blocks)
	blocks.each do |c|
		c["index"] = @chain.size + 1
		@chain << c
	end
	@chain
	end


end



