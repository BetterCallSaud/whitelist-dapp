// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhiteListedAddress;
    mapping(address => bool) public whiteListedAddresses;
    uint8 public numAddressesWhiteListed;

    constructor (uint8 _maxWhiteListedAddress) {
        maxWhiteListedAddress = _maxWhiteListedAddress;
    }

    function addAddressToWhitelist() public {
        // we are using the NOT operator, coz every default bool value in Solidity is "false"
        require(!whiteListedAddresses[msg.sender], "Sender has already been whitelisted.");
        require(numAddressesWhiteListed < maxWhiteListedAddress, "More addresses can't be added, limit reached.");
        whiteListedAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }
}