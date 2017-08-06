# Getting Started
* Please download and install the Parity client. 
  https://github.com/paritytech/parity/releases/tag/v1.7.0

* Start parity for Kovan test network: 
`parity --peers 5 --chain testnet -l own_tx=trace`

* Open parity ui : `parity ui`

* Create an account, use an easy password

* We need Ether in order to get started.
  there are [many](https://github.com/kovan-testnet/faucet) ways.

  Easiest is to simply [ask](https://gitter.im/kovan-testnet/faucet).
  Login and give out your test network address 0x....

* An alternative is to use your private chain : `parity --chain dev`

# Auction Contract

This contact simulates a public auction for an asset. 

Following can be used as a guide to play with it. 2 or more accounts wiil be needed.

- Deploy the Auction contract from account A with enough gas.
- Send 0.01 ETH to it from Account B. Account B will now lead the auction.
- Send 0.02 ETH to it from Account A. Account A will lead the auction, and B's ETH will be returned.
- Now Deploy the Bidder contract from Account B.
- Call Bidder's placeBid function with address of Auction & 0.03 ETH. Give it around 60K gas.
- The Bidder Account should lead the auction. A's ETH should be returned.
- Now any other attempts to send ETH to Auction should be rejected.

# Some Useful links:

[Remix](https://remix.ethereum.org/) - A very useful web based IDE for solidity.

[Solidity Documents](http://solidity.readthedocs.io/en/latest/contracts.html)

[Truffle Framework](http://truffleframework.com/docs/getting_started/contracts) - A framework for developing smart contracts and apps that interact with them.

This is fantastic : https://github.com/ConsenSys/smart-contract-best-practices

https://medium.com/zeppelin-blog/onward-with-ethereum-smart-contract-security-97a827e47702 

https://dappsforbeginners.wordpress.com/tutorials/two-party-contracts/

http://solidity.readthedocs.io/en/develop/security-considerations.html
