const NOP = artifacts.require("./NOP.sol");

const now = parseInt(new Date() / 1000);
const startTime = now + 120;
const endTime = startTime + 604800;
const totalSupply = 20000000 * 10 ** 18;
const capOfWei = 200 * 10 ** 18;
const rate = totalSupply / capOfWei;
// TODO: use multi-sig wallet
const wallet = '0x7BFFadB78B16E55c409550a8Ad6aE1aceA0f2d0B';
const walletOfManager = '0x7BFFadB78B16E55c409550a8Ad6aE1aceA0f2d0B';
const walletOfDeveloper = '0x7BFFadB78B16E55c409550a8Ad6aE1aceA0f2d0B';

module.exports = async function (deployer, network, accounts) {
  deployer.deploy(NOP, startTime, endTime, rate, capOfWei, wallet, walletOfManager, walletOfDeveloper);
}
