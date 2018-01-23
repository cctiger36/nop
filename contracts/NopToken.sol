pragma solidity ^0.4.18;

import "./MintableToken.sol";

contract NOPToken is MintableToken {

  string public constant name = "NOP Token";
  string public constant symbol = "NOP";
  uint8 public constant decimals = 18;
}
