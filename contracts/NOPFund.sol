pragma solidity ^0.4.18;

import "./Ownable.sol";
import "./math/SafeMath.sol";

contract NOPFund is Ownable {
  using SafeMath for uint256;

  event Charge(address indexed charger, uint256 value);
  event Transfer(address indexed to, uint256 value);

  function () external payable {
    charge();
  }

  function charge() public payable {
    Charge(msg.sender, msg.value);
  }

  function transfer(address _to, uint256 _value) onlyOwner public returns (bool) {
    _to.transfer(_value);
    Transfer(_to, _value);
    return true;
  }
}
