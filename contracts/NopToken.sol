pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract NOPToken is MintableToken {

  string public constant name = "NOP Token";
  string public constant symbol = "NOP";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 200000 * (10 ** uint256(decimals));

  function NOPToken() public {
    totalSupply_ = INITIAL_SUPPLY;
  }
}
