pragma solidity ^0.4.18;

import "./crowdsale/CappedCrowdsale.sol";
import "./MintableToken.sol";
import "./NOPToken.sol";

contract NOP is CappedCrowdsale {

  function NOP(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _cap, address _wallet) public
    CappedCrowdsale(_cap)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
  }

  function createTokenContract() internal returns (MintableToken) {
    return new NOPToken();
  }
}
