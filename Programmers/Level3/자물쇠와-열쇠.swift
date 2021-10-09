import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    func rotated (arr:[[Int]]) -> [[Int]]{
        var rotateArr = Array(repeating: Array(repeating: 0, count: arr[0].count), count: arr.count)
        
        for i in 0..<arr.count {
            for j in 0..<arr[0].count {
                rotateArr[i][j] = arr[arr.count - j - 1][i]
            }
        }
        return rotateArr
    }
   
    for i in (0 - key.count + 1)..<(lock.count + key.count - 1) {
        for j in (0 - key[0].count + 1)..<(lock[0].count + key[0].count - 1) {
            var temp = lock
            var newKey = key
            for _ in 0..<4{
                newKey = rotated(arr: newKey)
                temp = lock
                outer: for k in 0..<newKey.count {
                    let nextKeyRow = i + k
                    for l in 0..<newKey[0].count{
                        let nextKeyCol = j + l   
                        if nextKeyRow < 0 || nextKeyCol < 0 || nextKeyRow >= lock.count || nextKeyCol >= lock[0].count {
                            continue
                        }
                        if temp[nextKeyRow][nextKeyCol] == 1 && newKey[k][l] == 1 {
                            break outer
                        }
                        if temp[nextKeyRow][nextKeyCol] == 0 {
                            temp[nextKeyRow][nextKeyCol] = newKey[k][l]
                        }
                    }
                }
                if temp.allSatisfy({ row in row.allSatisfy({elem in elem == 1}) }) {
                    return true
                }
            }
        }
    }
    return falseßß
}