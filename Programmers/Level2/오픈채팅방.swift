import Foundation

func solution(_ record:[String]) -> [String] {
    var history : [(action: String, id: String)] = []
    var idMap : [String : String] = [:]
    var answer: [String] = []
    for rec in record {
        let recArr = rec.components(separatedBy: " ")
        history.append((recArr[0], recArr[1]))
        switch recArr[0] {
        case "Enter":
            idMap[recArr[1]] = recArr[2]
        case "Change":
            idMap[recArr[1]] = recArr[2]
        default:
            break;
        }
    }
    
    for (action, id) in history {
        switch action {
        case "Enter":
            answer.append("\(idMap[id]!)님이 들어왔습니다.")
        case "Leave":
            answer.append("\(idMap[id]!)님이 나갔습니다.")
        default:
            break
        }
    }
    return answer
    
}