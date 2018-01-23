const NOP = artifacts.require("./NOP.sol");

const now = parseInt(new Date() / 1000);
const startTime = now;
const endTime = startTime + 3600;
const totalSupply = 20000000 * 10 ** 18;
const weiLimit = 200 * 10 ** 18;
const rate = totalSupply / weiLimit;
// TODO: use multi-sig wallet
const wallet = 0x8a20a13b75d0aefb995c0626f22df0d98031a4b6;

module.exports = async function (deployer, network, accounts) {
  deployer.deploy(NOP, startTime, endTime, rate, totalSupply, wallet);
}
