func solution(_ n:Int64) -> Int64 {
    Int64(String(String(n).sorted(by: >)))!
}