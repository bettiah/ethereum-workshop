contract SetVar {
  uint _var;
  uint public _lastTimeVarWritten;
  address public owner;

  event LogLastTimeVarWritten(uint timestamp);
  event Dying(uint timestamp);

  function SetVar() {
      owner = msg.sender;
  }
  
  function die() {
    if (msg.sender == owner) {
        Dying(block.timestamp);
        selfdestruct(owner);
    }
  }
  
  function setVar(uint var1){
    _var=var1;
    _lastTimeVarWritten = block.timestamp;
    LogLastTimeVarWritten(_lastTimeVarWritten);
  }
}

// https://ethereum.stackexchange.com/questions/23008/how-to-create-in-test-regime-hello-world-my-very-first-and-simple-contract-in/23012#23012