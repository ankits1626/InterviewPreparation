import UIKit


func timeElapsedInSecondsWhenRunningCode(operation: ()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("time lapsed = \(Double(timeElapsed))")
    print("----------------------- \n \n")
}



//var greeting = "Hello, playground"
//
//
//public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
//    if A.isEmpty{
//        return A
//    }
//    var iter = 0
//    var rotatedArr = A
//    while iter < (K){
//        var tempArr = [rotatedArr.last!]
//        var i = 0
//        print("A count = \(A.count) && i = \(i) && last = \(rotatedArr.last!)")
//        while i < (A.count - 1){
//            print("iter = \(iter) -- i = \(i) - \(tempArr)")
//            tempArr.append(rotatedArr[i])
//            i = i + 1
//        }
//        iter = iter + 1
//        rotatedArr = tempArr
//        print("roateted array after iter = \(iter) is \(rotatedArr)")
//    }
//    print("rotated arr is  \(rotatedArr)")
//    return rotatedArr
//}
//
//let nums = [1, 6, 3, 9, 4, 6];
//let numMax = nums.reduce(Int.min, { max($0, $1) })
//print("num max is \(numMax)")
//let num = 1
//var next = num / 2
//var remainder = num % 2
//
//var test_arr = [Int]()
//print(test_arr)
//solution(&test_arr, 3)
//
//func steps(_ X : Int, _ Y : Int, _ D : Int) -> Int {
//    // write your code in Swift 4.2.1 (Linux)
//
//    return Int(ceil(Double(abs(Y - X)) / Double(D)))
//}
//
//print("steps = \(steps(85, 10, 30))")




/**
 Dynamic Programming : Coin Problem
 refernce: https://www.youtube.com/watch?v=-NTaXJ7BBXs
 **/




var resultMap = [Int : Int]()

func minCoins(_ availableCoins : [Int], total: Int, useMemoization: Bool) -> Int{
    
    var ans = Int.max
    if total == 0{
        return 0
    }
    if useMemoization,
       let storedResult = resultMap[total]{
        return storedResult
    }
    for coin in availableCoins {
        if (total - coin) >= 0 {
            let calc = minCoins(availableCoins, total: total - coin, useMemoization: useMemoization)
            if calc < ans{
                ans = calc + 1
            }
        }
    }
    if useMemoization{
        resultMap[total] = ans
    }
    
    return ans
}





let coinDenominations = [1,5,7]
let total  = 30

timeElapsedInSecondsWhenRunningCode {
    print("minimum coins required with memoization = \(minCoins(coinDenominations, total: total, useMemoization: true))")
}


timeElapsedInSecondsWhenRunningCode {
    print("minimum coins required = \(minCoins(coinDenominations, total: total, useMemoization: false))")
}

print(resultMap.sorted(by: <))

