func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    for (row1, row2) in zip(arr1, arr2) {
        var singleRow:[Int] = []
        for (col1, col2) in zip(row1, row2) {
            singleRow.append(col1 + col2)
        } 
        result.append(singleRow)
    }
    return result
}