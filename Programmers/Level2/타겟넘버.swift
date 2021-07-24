import Foundation

func dfs(_ index : Int, _ numbers : inout [Int], _ sum : Int, _ target : Int) -> Int{
    if index == numbers.count {
        return sum == target ? 1 : 0
    }
    return dfs(index + 1, &numbers, sum + numbers[index], target)
            + dfs(index + 1, &numbers, sum - numbers[index], target)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var nums = numbers
    return dfs(0, &nums, 0, target)
}