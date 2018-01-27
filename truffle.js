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
      from: "0x1B2c51401a72d9dfA80dd735D668F47b7bEd15e7"
    }
  }
};
