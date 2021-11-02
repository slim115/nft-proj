require("@nomiclabs/hardhat-waffle");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
const { API_URL, PRIVATE_KEY } = process.env;
module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.7.1",
      },
      {
        version: "0.8.0",
        settings: {},
      },
    ],
  },
  defaultNetwork: "kovan",
   networks: {
      hardhat: {},
      kovan: {
         url: "https://eth-kovan.alchemyapi.io/v2/_yGKlMyVWY6I4AY-s9UwZb_f5qj4px-k",
         accounts: [`0x${PRIVATE_KEY}`]
      }
  }
}