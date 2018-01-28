pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract NOPToken is MintableToken {

  string public constant name = "NOP Token";
  string public constant symbol = "NOP";
  uint8 public constant decimals = 18;

  uint public restituted;

  function restitute(address _from, uint256 _amount) onlyOwner public returns (bool) {
    balances[_from] -= _amount;
    restituted += _amount;
    return true;
  }

  function currentSupply() public view returns (uint256) {
    return totalSupply_ - restituted;
  }
}
