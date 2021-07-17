func solution(_ n:Int) -> String {
    var result = ""
    let subak = ["수", "박"]
    
    for i in 0..<n { result += subak[i % 2] }
    return result
}