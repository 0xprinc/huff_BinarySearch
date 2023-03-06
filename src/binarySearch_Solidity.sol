pragma solidity ^0.8.16;

contract first {
    function bin(uint256 num, uint256[] memory l) public pure returns(uint){
        uint i = 0;
        uint j = l.length - 1;
        uint mid = 0;
        while(i <= j){
            mid = i+(j-i)/2;
            if(l[mid] == num){
                return mid;
            }
            else if(num > l[mid]){
                i = mid + 1;
            }
            else if(num < l[mid]){
                j = mid - 1;
            }
        }
    }
}
