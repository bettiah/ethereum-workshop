pragma solidity ^0.4.1;

contract Bidder {
    address public owner;

    event LogWithdrawal(uint amount);
    event LogDepositReceived(address sender, uint rx);
    event Dying(uint timestamp);

    function Bidder() {
      owner = msg.sender;
    }

    function() payable { 
        if(msg.sender != owner) {
            throw;
        }
        LogDepositReceived(msg.sender, msg.value); 
    }

    modifier onlyOwner {
        if(msg.sender != owner) throw;
        _;
    }    
    
    function placeBid(address dest) onlyOwner payable returns(bool success) {
        LogWithdrawal(this.balance);
        return dest.call.value(this.balance)(bytes4(keccak256("bid()")));
    }

    function die() onlyOwner {
        Dying(block.timestamp);
        selfdestruct(owner);
    }
    
}