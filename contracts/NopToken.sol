pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract NOPToken is MintableToken {

  string public constant name = "NOP Token";
  string public constant symbol = "NOP";
  uint8 public constant decimals = 18;

  function restitute(address _from, uint256 _amount) onlyOwner public returns (bool) {
    balances[_from] -= _amount;
    totalSupply_ -= _amount;
    return true;
  }
}
