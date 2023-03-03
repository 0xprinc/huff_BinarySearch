// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";

contract binaryTest is Test {

    binarySearch public b;

    /// @dev Setup the testing environment.
    function setUp() public {
        b = binarySearch(
            HuffDeployer.deploy("binarySearch")
        );
    }

    /// @dev Ensure that it returns passed arr.
    // fuzz testing for the value other than the array
    function test_1(uint x) public {                      
        uint256[] memory arr = new uint256[](6);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        arr[4] = 5;
        arr[5] = 6;
        assertEq(b.binary(1,arr),0);
        assertEq(b.binary(2,arr),1);
        assertEq(b.binary(3,arr),2);
        assertEq(b.binary(4,arr),3);
        assertEq(b.binary(5,arr),4);
        assertEq(b.binary(6,arr),5);
        if(x > 6){
            assertEq(b.binary(x,arr),255);
        }
    }

    // fuzz testing on empty array
    function test_2(uint x) public {                    
        uint256[] memory arr = new uint256[](0);
        assertEq(b.binary(x,arr),255);              
    }
}

interface binarySearch {
    function binary(uint256,uint256[] memory)
        external
        returns (uint256);
}
