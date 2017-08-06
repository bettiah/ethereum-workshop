* Please download and install the Parity client. 
  They were download earlier in the day from 
  https://github.com/paritytech/parity/releases/tag/v1.7.0

* Install but dont start yet.

* Open a shell (terminal) / command prompt (cmd.exe) and find your parity installation
  C:\Program Files\Parity\Parity

  Note: Stop the currently running instance.

* Restore

`parity --chain testnet -- restore /tmp/kovan.db`
`parity --chain testnet -- restore \Users\me\Downloads\kovan.db`

* Start parity for testnet

`parity --peers 5 --chain testnet -l own_tx=trace`


* open parity ui

`parity ui`

* create an account, use an easy password

* We need Ether in order to get started
  there are many ways:
  https://github.com/kovan-testnet/faucet
  easiest is to simply ask: https://gitter.im/kovan-testnet/faucet.
  Login and give out your testnet address 0x....

* The Auction contact simulates a public auction for an asset. You can use the following as a guide to play with it. You will need 2 or more accounts.
- Deploy the Auction contract from account A with enough gas.
- Send 0.01 ETH to it from Account B. Account B will now lead the auction.
- Send 0.02 ETH to it from Account A. Account A will lead the auction, and B's ETH will be returned.
- Now Deploy the Bidder contract, from Account B.
- Call Bidder's placeBid call with address of Auction & 0.03 ETH. Give it around 60K gas.
- The Bidder Account should lead the auction. A's ETH should be returned.
- Now any other attempts to send ETH to Auction should be rejected.