import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedByStartTime = jobs.sorted(by: {
        if $0[0] == $1[0] { return $0[1] > $1[1] }
        else { return $0[0] > $1[0] }
    })
    var jobQueue: [[Int]] = [sortedByStartTime.removeLast()]
    var totalTime = 0
    var currentTime = jobQueue.first![0]
    
    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        totalTime += abs(currentTime - now[0]) + now[1]
        currentTime += now[1]

        while !sortedByStartTime.isEmpty && sortedByStartTime.last![0] <= currentTime {
            jobQueue.append(sortedByStartTime.removeLast())
        }
        jobQueue.sort(by: { $0[1] > $1[1] })
        
        if jobQueue.isEmpty && !sortedByStartTime.isEmpty{
            jobQueue.append(sortedByStartTime.removeLast())
            currentTime += abs(currentTime - jobQueue.last![0])
        }
    }
    return totalTime / jobs.count
}