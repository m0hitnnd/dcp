import UIKit

/// distinct streak
/// Input
/// abrkaabcdefghijjxxx
/// Output
/// 10
/// abrak
/// brak, 4
/// barkaabcd

func distinctStreak(inputString: String) -> Int {
    guard inputString.isEmpty == false else {
        return 0
    }
    var maxTotalCount = 1
    let stringCharCount = inputString.count
    for i in 0..<stringCharCount {
        var totalCount = 1
        var charSet: Set<Character> = []
        
        let idx = inputString.index(inputString.startIndex, offsetBy: i)
        charSet.insert(inputString[idx])
        
        var j = i + 1
        while j < stringCharCount, !charSet.contains(inputString[inputString.index(inputString.startIndex, offsetBy: j)]) {
            let secondIdx = inputString.index(inputString.startIndex, offsetBy: j)
            charSet.insert(inputString[secondIdx])
            totalCount += 1
            j += 1
        }
        
        maxTotalCount = max(totalCount, maxTotalCount)
    }
    return maxTotalCount
}

distinctStreak(inputString: "abrkaabcdefghijjxxx")
distinctStreak(inputString: "abrak")
distinctStreak(inputString: "")
distinctStreak(inputString: "acddcba")
distinctStreak(inputString: "acbdegfchab")



/// distinct streak
/// Input
/// abrkaabcdefghijjxxx
/// Output
/// 10
/// abrak
/// brak, 4
/// barkaabcd
/// brakaabcd


func distinctStreakOptimized(inputString: String) -> Int {
    guard inputString.isEmpty == false else {
        return 0
    }
    
    var leftIndex = inputString.startIndex
    var rightIndex = leftIndex
    var charSet: [Character: String.Index] = [:]
    var maxCount = 0
    
    while rightIndex < inputString.endIndex {
        let newChar = inputString[rightIndex]
        
        if let newCharEarlierIndex = charSet[newChar], newCharEarlierIndex >= leftIndex {
            maxCount = max(maxCount, inputString.distance(from: leftIndex, to: rightIndex))
            leftIndex = inputString.index(after: newCharEarlierIndex)
        }
        
        charSet[newChar] = rightIndex
        rightIndex = inputString.index(after: rightIndex)
    }
    let final = max(maxCount, inputString.distance(from: leftIndex, to: rightIndex))
    return final
}


distinctStreakOptimized(inputString: "abrkaabcdefghijjxxx")
distinctStreakOptimized(inputString: "abrak")
distinctStreakOptimized(inputString: "")
distinctStreakOptimized(inputString: "acddcba")
distinctStreakOptimized(inputString: "acbdegfchab")
distinctStreakOptimized(inputString: "abrab")
