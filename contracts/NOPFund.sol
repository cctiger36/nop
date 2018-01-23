pragma solidity ^0.4.18;

import "./math/SafeMath.sol";

contract NOPFund {
  using SafeMath for uint256;

  event Charge(address indexed charger, uint256 value);

  function () external payable {
    charge();
  }

  function charge() public payable {
    Charge(msg.sender, msg.value);
  }
}
