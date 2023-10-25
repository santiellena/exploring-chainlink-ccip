// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {CCIPTokenSender} from "../src/CCIPTokenSender.sol";

contract DeployCCIPTokenSender is Script {
    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address fujiLink = 0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846;
        address fujiRouter = 0x554472a2720E5E7D5D3C817529aBA05EEd5F82D8;

        CCIPTokenSender sender = new CCIPTokenSender(
            fujiLink,
            fujiRouter
        );

        console.log("CCIPTokenSender deployed to ", address(sender));

        vm.stopBroadcast();
    }
}
