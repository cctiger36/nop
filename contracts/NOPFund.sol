pragma solidity ^0.4.18;

import "./math/SafeMath.sol";

contract NOPFund {
  using SafeMath for uint256;

  uint256 public totalWeiAmount;

  event Charge(address indexed charger, uint256 value);

  function () external payable {
    charge();
  }

  function charge() public payable {
    uint256 weiAmount = msg.value;
    totalWeiAmount = totalWeiAmount.add(weiAmount);
    Charge(msg.sender, weiAmount);
  }
}
