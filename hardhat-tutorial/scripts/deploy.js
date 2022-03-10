const { ethers } = require("hardhat");

async function main() {
    const whiteListContract = await ethers.getContractFactory("Whitelist");
    const deployedContract = await whiteListContract.deploy(10);
    await deployedContract.deployed();
    console.log(
        "Whitelist Contract Address: ",
        deployedContract.address
    );
}

main()
    .then(() => process.exit(0))
    .catch((err) => {
        console.error(err);
        process.exit(1);
    })