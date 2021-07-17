func gcd (_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : gcd(b, a % b)
}

func lcm (_ a: Int, _ b: Int, _ gcdResult: Int) -> Int {
    return a * b / gcdResult;
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcdResult = gcd(n, m)
    return [gcdResult, lcm(n, m, gcdResult)]
}