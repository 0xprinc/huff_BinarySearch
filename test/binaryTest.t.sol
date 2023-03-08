// INTERFACE
#define function binary(uint256,uint256[]) nonpayable returns(uint256)

/*  calldata :
    0x | function selector(0x04 bytes) | num(0x20 bytes) | list_offset(0x20) | list_length(0x20) | list[0](first element)(32 bytes) | ... 
*/

/*  memory(to be set) :
    i(left pointer)  |  m(mid pointer)  |  j(right pointer)  |  index of list that i is pointing  |  index of list that j is pointing
    0x00             |  0x20            |  0x40              |  0x60                              |  0x80s
*/


// MACROS
#define macro BINARY() = takes(0) returns(0) {
    
    // storing i and j inside the memory 
    0x64    returndatasize      mstore                      
    0x44                                        // [0x44]
    dup1    calldataload                        // [length, 0x44 ]
    0x20    mul    add    0x40                  // [ 0x20 * length (offset of end of array) , 0x40]
    mstore

    while:
        // while(i<=j) statement
        returndatasize  mload                           // [i]
        0x40    mload                                   // [j,i]   
        // if (j<i) then jump to not found
        lt  not_found  jumpi    

        // calling the i index as zero index rather than the byte offset
        0x20    0x64    returndatasize    mload   sub     div             //  [(i - 0x64)/0x20 ]
        0x60    mstore                                                    

        // calling the j index as zero index rather than the byte offset
        0x20    0x64    0x40    mload   sub     div                     //  [(j - 0x64)/0x20]
        0x80    mstore
        
        0x02    0x60    mload   0x80    mload   sub     div     0x60        
        mload   add     0x20    mul     0x64    add     0x20            // [ i + (j-i)/2 ]  = [m]
        mstore      

        // if the middle value is the num
        0x20    mload   calldataload    0x04    calldataload            // [num, m]
        eq    ans    jumpi 
        //  if the num is greater than the middle value   
        0x20    mload   calldataload    0x04    calldataload            // [num, m]    
        gt    great    jumpi  
        //   if the num is smaller than the middle value
        0x20    mload   calldataload    0x04    calldataload            // [num, m]    
        lt    less    jumpi    

    not_found:       
        0x00    0x00    revert
    
    ans:
        // index of the value from the value of m
        0x20    0x64    0x20    mload   sub     div                     //  [ (m - 0x64)/0x20 ] 
        0x20    mstore     
        0x20    0x20    return
    
    great:
        // i = mid + 1
        0x20    0x20    mload                       //  [m, 0x20]
        add                                         //  [m + 0x20]
        returndatasize    mstore    
        // reiterating through while
        pc      while   jumpi      
    less:
        // j = mid - 1
        0x20    0x20    mload               //      [m, 0x20]
        sub                                 //      [m - 0x20]
        0x40    mstore      
        // reiterating through while
        pc      while   jumpi       
} 


// ENTRY POINT
#define macro MAIN() = takes(0) returns(0) {
    returndatasize    calldataload    0xE0    shr   

    __FUNC_SIG(binary) eq binary jumpi

    binary:
        BINARY()
}
