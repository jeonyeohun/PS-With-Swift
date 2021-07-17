import Foundation

func solution(_ s:String) -> Bool {
    var loweredS = s.lowercased()
    return loweredS.filter({ $0 == "p" }).count == loweredS.filter({ $0 == "y" }).count
}