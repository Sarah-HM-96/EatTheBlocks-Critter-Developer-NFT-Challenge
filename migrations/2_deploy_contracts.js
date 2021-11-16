const SuperDeveloper = artifacts.require("./SuperDeveloper");

module.exports = function(deployer) {
    deployer.deploy(SuperDeveloper, "SuperDeveloper", "SPD");
};