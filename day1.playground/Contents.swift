import UIKit

// 2, 6, 7, 9, 1  : 10
// 2, 2, 4, 5, 6 : 4

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<(nums.count - 1) {
        let first = nums[i]
        for j in (i + 1)..<nums.count {
            let second = nums[j]
            if first + second == target {
                return [i, j]
            }
        }
    }
    return []
}

// O(n^2)


twoSum([2, 6, 7, 9, 1], 10)
twoSum([2, 2, 4, 5, 6], 4)
twoSum([2, 2, 4, 5, 6], 12)


func twoSumOptim(_ nums: [Int], _ target: Int) -> [Int] {
    var numsDict: [Int: Int] = [:]
    numsDict[nums[0]] = 0
    for i in 1..<nums.count {
        let second = nums[i]
        let diff = target - second
        if let storedNumIndice = numsDict[diff] {
            return [storedNumIndice, i]
        }
        numsDict[second] = i
    }
    return []
}



twoSumOptim([2, 6, 7, 9, 1], 10)
twoSumOptim([2, 2, 4, 5, 6], 4)
twoSumOptim([2, 2, 4, 5, 6], 12)


func twoSumSorted(_ nums: [Int], _ target: Int) -> [Int] {
    // Your two-pointer solution here
    var left = 0
    var right = nums.count - 1
    while left < right {
        if nums[left] + nums[right] == target {
            return [left, right]
        }
        if nums[left] + nums[right] < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return []
}


twoSumSorted([1,2,6,7,9], 7)
twoSumSorted([2, 2, 4, 5, 6], 4)
twoSumSorted([2, 2, 4, 5, 6], 12)
