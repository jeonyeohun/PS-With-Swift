func solution(_ msg:String) -> [Int] {
    var dict = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map({ String($0) })
    var message = msg.map({ String($0) })
    var output: [Int] = []
    var input: String = ""
    
    while !message.isEmpty {
        input += message.removeFirst()
        
        guard let next = message.first else {
            output.append(dict.firstIndex(of: input)! + 1)
            break
        }
        if let index = dict.firstIndex(of: input), !dict.contains(input + next) {
            output.append(index + 1)
            dict.append(input + next)
            input = ""
        }
    }   
    return output
}