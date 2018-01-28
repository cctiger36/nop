pragma solidity ^0.4.18;

import "./MintableToken.sol";
import "./NOPFund.sol";
import "./NOPToken.sol";
import "./crowdsale/CappedCrowdsale.sol";
import "./math/SafeMath.sol";

contract NOP is CappedCrowdsale {
  using SafeMath for uint256;

  event Withdraw(address indexed owner, uint256 amount, uint256 value);

  uint256 public constant minPurchase = 0.1 ether;

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

  function validPurchase() internal view returns (bool) {
    bool aboveMinPurchase = msg.value >= minPurchase;
    return aboveMinPurchase && super.validPurchase();
  }

  function tokenPriceOfFund() public view returns (uint256 price) {
    uint256 currentTokenSupply = NOPToken(token).currentSupply() / (10 ** 18);
    return fund.balance.div(currentTokenSupply);
  }

  function fundBalanceOf(address _owner) public view returns (uint256 balance) {
    uint256 tokenAmount = token.balanceOf(_owner);
    return fund.balance.mul(tokenAmount).div(NOPToken(token).currentSupply());
  }

  function withdrawFromFund(uint256 _tokenAmount) public returns (bool) {
    require(_tokenAmount > 0);
    require(fund.balance > 0);
    uint256 tokenBalance = token.balanceOf(msg.sender);
    require(_tokenAmount <= tokenBalance);
    uint256 weiAmount = fund.balance.mul(_tokenAmount).div(NOPToken(token).currentSupply());
    NOPToken(token).restitute(msg.sender, _tokenAmount);
    fund.transfer(msg.sender, weiAmount);
    Withdraw(msg.sender, _tokenAmount, weiAmount);
    return true;
  }
}
