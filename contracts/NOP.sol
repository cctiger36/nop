pragma solidity ^0.4.18;

import "./math/SafeMath.sol";
import "./crowdsale/CappedCrowdsale.sol";
import "./MintableToken.sol";
import "./NOPToken.sol";
import "./NOPFund.sol";

contract NOP is CappedCrowdsale {
  using SafeMath for uint256;

  NOPFund public fund;

  function NOP(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _cap, address _wallet) public
    CappedCrowdsale(_cap)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    fund = new NOPFund();
  }

  function createTokenContract() internal returns (MintableToken) {
    return new NOPToken();
  }

  function fundBalanceOf(address _owner) public view returns (uint256 balance) {
    uint256 tokenAmount = token.balanceOf(_owner);
    uint256 tokenTotalSupply = token.totalSupply();
    return fund.totalWeiAmount().mul(tokenAmount).div(tokenTotalSupply);
  }
}
