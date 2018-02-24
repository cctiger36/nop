pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract NOPToken is MintableToken {
  using SafeMath for uint256;

  event Restitute(address indexed from, uint256 value);

  string public constant name = "NOP Token";
  string public constant symbol = "NOP";
  uint8 public constant decimals = 18;

  function restitute(address _from, uint256 _value) onlyOwner public returns (bool) {
    balances[_from] = balances[_from].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    Restitute(_from, _value);
    return true;
  }

  function grantToken(address _to, uint256 _value) onlyOwner public returns (bool) {
    balances[_to] = balances[_to].add(_value);
    totalSupply_ = totalSupply_.add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}
