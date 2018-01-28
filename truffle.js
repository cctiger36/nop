const HDWalletProvider = require("truffle-hdwallet-provider");
const mnemonic = process.env.MNEMONIC_KEY;
const rinkeby = new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/jpOo0xf4ZIdTUKNV0Iqu");

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    rinkeby: {
      provider: rinkeby,
      network_id: 4,
      gas: 6700000,
      gasPrice: 20000000000
    }
  }
};
