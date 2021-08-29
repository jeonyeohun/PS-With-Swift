import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var executionTime = 0
    let hitTime = 1
    let missTime = 5
    
    if cacheSize == 0 {
        return cities.count * missTime
    }
    
    for city in cities.map({ $0.uppercased() }) {
        var nextExecutionTime = missTime
        if let cityIndex = cache.firstIndex(where: { $0 == city }) {
            nextExecutionTime = hitTime
            cache.remove(at: cityIndex)
        }
        
        if cache.count == cacheSize { cache.removeFirst() }
        
        executionTime += nextExecutionTime
        cache.append(city)
    }
    return executionTime
}