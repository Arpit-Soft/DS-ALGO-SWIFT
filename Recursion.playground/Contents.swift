import UIKit


// Factorial Using Recursion
func factorial(of number: Int) -> Int {
    
    // base case
    if number == 0 {
        return 1
    }
    
    // recursive case
    return number * factorial(of: number - 1)
}

let number = 5
let fact = factorial(of: number)
print("Factorial of \(number) is \(fact)")


// 2^3 = 2 * 2 * 2 = 8
func power(of number: Int, times: Int) -> Int {
    
    if times == 0 {
        return 1
    }
    
    return number * power(of: number, times: times - 1)
}

let number1 = 2
let times = 3
let result = power(of: number1, times: times)
print("\(number1) of \(times) times is \(result)")
