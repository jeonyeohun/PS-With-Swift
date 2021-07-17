func solution(_ s:String) -> Bool {
    (s.count == 4 || s.count == 6) && s.allSatisfy({ $0.isNumber }) ? true : false
}