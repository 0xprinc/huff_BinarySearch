// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";

contract bintest is Test {
    /// @dev Address of the InsertionSort contract.
    bin public b;

    /// @dev Setup the testing environment.
    function setUp() public {
        b = bin(
            HuffDeployer.deploy("bin")
        );
    }

    /// @dev Ensure that it returns passed arr.
    function testone() public {
        uint256[] memory arr = new uint256[](6);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        arr[4] = 5;
        arr[5] = 6;
        assertEq(b.binary(10,arr),255);

    }
}

interface bin {
    function binary(uint256,uint256[] memory)
        external
        returns (uint256);
}
