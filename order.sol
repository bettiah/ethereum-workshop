pragma solidity ^0.4.14;

contract Order {

    address public owner;

    struct OrderStruct {
        address sender;
        uint amountReceived;
    }

    mapping(bytes32 => OrderStruct) orderStructs;

    event LogWithdrawal(uint amount);
    event LogOrder(address sender, bytes32 orderNumber, uint amount);
    event Dying(uint timestamp);

    modifier onlyOwner {
        if(msg.sender != owner) throw;
        _;
    }    

    function Order() public {
        owner = msg.sender;
    }

    function recordOrder(bytes32 orderNumber) payable returns(bool success) {
        if(msg.value==0) throw;
        orderStructs[orderNumber].sender = msg.sender;
        orderStructs[orderNumber].amountReceived = msg.value;
        LogOrder(msg.sender, orderNumber, msg.value);
        return true;
    }

    function getOrder(bytes32 orderNumber) constant returns(address sender, uint amount) {
        return(orderStructs[orderNumber].sender, orderStructs[orderNumber].amountReceived);
    }

    function withdrawFromContract(uint amount) onlyOwner returns(bool success) {
        if(amount > this.balance) throw; // not enough money
        if(msg.sender.send(amount)) {
            LogWithdrawal(amount);
            return true;
        } else {
            throw;
        }
    }

    function die() onlyOwner {
        Dying(block.timestamp);
        selfdestruct(owner);
    }
}

// https://ethereum.stackexchange.com/questions/11787/accepting-ethereum-on-a-website/11790#11790
