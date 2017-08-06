pragma solidity ^0.4.1;

contract Auction {
    address public owner;
    address public currentLeader;
    uint public highestBid;

    event LogBidReceived(address sender, uint rx);
    event Accepted(address sender, uint rx);
    event Dying(uint timestamp);

    function Auction() {
      owner = msg.sender;
    }

    function bid() payable {
        LogBidReceived(msg.sender, msg.value); 
        
        require(msg.value > highestBid);

        if (currentLeader != 0) {
            // here is the problem.
            // it this throws, the current leader cannot be replaced
            if (!currentLeader.send(highestBid)) { throw; } // Refund the old leader, and throw if it fails
        }

        currentLeader = msg.sender;
        highestBid = msg.value;
    }

    modifier onlyOwner {
        if(msg.sender != owner) throw;
        _;
    }    

    function die() onlyOwner {
        Dying(block.timestamp);
        selfdestruct(owner);
    }
}