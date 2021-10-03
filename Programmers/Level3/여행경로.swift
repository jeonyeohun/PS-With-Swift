import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var routes: [String : [(city: String, visited: Bool)]] = [:]
    for ticket in tickets {
        routes[ticket[0]] == nil
        ? routes[ticket[0]] = [(ticket[1], false)]
        : routes[ticket[0]]?.append((ticket[1], false))
    }
    routes.keys.forEach({ startCity in
        routes[startCity]?.sort(by: {$0.city <= $1.city})
    })
    
    var path:[String] = ["ICN"]
    
    func dfs(here: String) -> [String] {
        if routes.values.flatMap({ $0 }).allSatisfy({ ticket in ticket.visited == true }) {
            return path
        }
        
        guard let nextRoute = routes[here] else { return [] }
        
        for (index, next) in nextRoute.enumerated() {
            if !next.visited {
                routes[here]![index].visited.toggle()
                path.append(next.city)
                let answer = dfs(here: next.city)
                if !answer.isEmpty {
                    return answer
                }
                path.removeLast()
                routes[here]![index].visited.toggle()
            }
        }
        return []
    }
    return dfs(here: "ICN")
}