# <img  alt="Chainlink Logo" src="https://cryptologos.cc/logos/chainlink-link-logo.png" style="width: 40px;"> Exploring Chainlink CCIP 

## Introduction:
The Chainlink Cross-Chain Integration Protocol (CCIP) offers a unified and straightforward platform, allowing dApps and web3 entrepreneurs to confidently fulfill their cross-chain needs.

In my opinion, the idea of implementing a smart contract as router of the protocol is the most interesting part. As you can see, a router connects the end-user with the protocol and allows end-users to use CCIP by just learning how to intereact with the router contract.

<img alt="CCIP Basic Architecture" src="https://2422224061-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FEm7Dwh3rUCIyHWLvZwRo%2Fuploads%2FeBXc5q78HsM8SNOYHUMS%2Fbasic-architecture.png?alt=media&token=bae48b0f-ff55-49b3-857b-d8f35166266e">


#### Router in depth:
As said, the router is the contract responsible for initiating cross-chain interactions. There is one router per chain.

When transfering tokens, the router contract routes the instruction to the destination-specific <code>OnRamp</code>. The <code>OnRamp</code> is a unique contract responsible for validating the incoming data and located within a 'lane' (the onRamp contract is more complex than that, I only intend to give a superficial description so that you can continue reading. A better explanation can be found [here](https://docs.chain.link/ccip/architecture#onramp)).

A 'lane' is an unidirectional path between a source and a destination blockchain.

When receiving tokens, the router is the smart contract that sends the tokens or the message to the receiver. The router receives the data from a <code>OffRamp</code> contract. The <code>OffRamp</code> is a unique contract responsible for verifying the proof provided by the [Executing DON](https://docs.chain.link/ccip/architecture#executing-don) against a committed and blessed [Merkle root](https://en.wikipedia.org/wiki/Merkle_tree).


## Faucets:
If you want to experiment with CCIP, Chainlink provides a couple of allowed tokens that can be used for testing.

But first get some Link tokens so you can pay the fees:

1. Go to https://faucets.chain.link/.
2. In Metamask, select the network where you want to receive testnet LINK.
3. Click Connect wallet so the faucet app can detect the network and wallet address.
4. If you want to receive testnet funds at a different address, paste it in the Wallet address section. This field defaults to your connected wallet address.
5. In the Request type section, select the testnet funds that you want to receive.
6. Complete the Captcha and click Send request. The funds are transferred from the faucet to the wallet address that you specified.

#

Two ERC20 test tokens are currently available on each testnet: CCIP-BnM (burn & mint) and CCIP-LnM (lock & mint).

Add CCIP-BnM to you previously connected to Avalanche Fuji wallet and then mint some tokens [here](https://docs.chain.link/ccip/test-tokens#mint-tokens-in-the-documentation)


## Getting started:

To use this code, you need to have installed [foundry](https://github.com/crisgarner/awesome-foundry) & [npm](https://nodejs.org/en)

To check if you have them installed: 

```shell
# In case you have them installed you will see the versions
$ forge --version
$ npm --version

```

Install the necessary dependencies:

```shell
$ make install

```



## CCIP Send Tokens

### Usage:

#### From Avalanche Fuji to Sepolia:

1) Deploy <code>CCIPTokenSender.sol</code>:


```shell
$ make deploy

```

2) Fund <code>CCIPTokenSender.sol</code>:

- Open [Metamask](https://metamask.io/) or your wallet of preference

- Send 1 Link (for fees) and the amount of CCIP-BnM you want to send

3) Transfer tokens:

To continue with this step, first go to the Makefile file and read carefully its comments. Make sure you modify the file before executing any make command.

- First you need to white list the destination chain:

```shell
$ make whitelist 

```

- Then just transfer the tokens

```shell
$ make transfer

```

4) Check your Wallet on Sepolia network.
- The tokens will arrive soon. As we are working with CCIP in testnets, transactions are slow.