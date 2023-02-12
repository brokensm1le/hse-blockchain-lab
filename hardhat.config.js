/** @type import('hardhat/config').HardhatUserConfig */
require("@nomiclabs/hardhat-waffle");

const ALCHEMY_API_KEY = "BAWsQZlWAYsafbfSnhmpscxrKpC_X9Ve";

const GOERLI_PRIVATE_KEY = "45f6c4187f69db8def243a60e2eea312aa32eb27b0426c3083b3b4028594ff82";

module.exports = {
  solidity: "0.8.17",
    networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};
