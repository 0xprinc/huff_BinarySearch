This repository contains the implementation of binary search algorithm written in HUFF for EVM chains.</br>
Given a sorted array, the Binary Search Algorithm searches for a specific element in a sorted list or array in an efficient way. 

pseudo-code for binary search is as follows:</br>
                // we are gonna use the two pointer for this algorithm </br>
                // left pointer points the start of the array </br>
                // right pointer  points the end of the array</br>
                
                while(left pointer <= right pointer){   
                
                    // middle pointer will be the average of the left and right pointer
                    middle  = left + (right - left)/2
                    
                    if(middle element == num){
                        return middle index;
                    }
                    else if(num > middle element){
                        left  = middle + 1;
                    }
                    else if(num < middle element){
                        right = middle - 1;
                    }
                }

I have also included the implementation of the binary search in solidity.


# to-do list 
1. Optimising this contract 
2. Writing more test contracts 
