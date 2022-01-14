var GasConsumptionArrays = artifacts.require("./GasConsumptionArrays.sol");
var GasConsumptionMappings = artifacts.require("./GasConsumptionMappings.sol");

module.exports = function (deployer) {
    deployer.deploy(GasConsumptionArrays);
    deployer.deploy(GasConsumptionMappings);
};