// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";

contract InsertionSortTest is Test {
    /// @dev Address of the InsertionSort contract.
    addT public ad;

    /// @dev Setup the testing environment.
    function setUp() public {
        ad = addT(
            HuffDeployer.deploy("addT")
        );
    }

    /// @dev Ensure that it returns passed arr.
    function testInsertionSort() public {
        assertEq(ad.addTwo(2,3),5);
        // console.log(ad.add)
    }
}

interface addT {
    function addTwo(uint256,uint256)
        external
        returns (uint256);
}
