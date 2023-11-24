-include .env

## 					¡¡¡¡¡		ALERT		!!!!!
##		Please, read the comments below before executing any command
##		

deploy:
	forge script ./script/CCIPTokenSender.s.sol:DeployCCIPTokenSender -vvv --broadcast --rpc-url avalancheFuji

# 16015286601757825753 is is the CCIP Chain Selector for the Ethereum Sepolia network
# ¡MODIFY <CCIP_TOKEN_SENDER_ADDRESS> WITH THE ADDRESS OF THE CONTRACT DEPLOYED WITH "make deploy"
whitelist:
	cast send <CCIP_TOKEN_SENDER_ADDRESS> --rpc-url avalancheFuji --private-key=$(PRIVATE_KEY) "whitelistChain(uint64)" 16015286601757825753

# 0xD21341536c5cF5EB1bcb58f6723cE26e8D8E90e4 is the CCIP-BnM token address on the Avalanche Fuji network
# ¡MODIFY <CCIP_TOKEN_SENDER_ADDRESS> WITH THE ADDRESS OF THE CONTRACT DEPLOYED WITH "make deploy"
# <RECEIVER_ADDRESS> is the address of the EOA that will receive the tokens in Ethereum Sepolia network
# 100 (last parameter) is the amount of token which will be sent (remember that CCIP-BnM works with 18 decimals)
transfer:
	cast send <CCIP_TOKEN_SENDER_ADDRESS> --rpc-url avalancheFuji --private-key=$(PRIVATE_KEY) "transferTokens(uint64,address,address,uint256)" 16015286601757825753 <RECEIVER_ADDRESS> 0xD21341536c5cF5EB1bcb58f6723cE26e8D8E90e4 100 


install:
	forge install smartcontractkit/chainlink --no-commit && npm install 
