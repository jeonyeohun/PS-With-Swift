import Foundation

struct Job {
    let start: Int
    let end: Int
}

func solution(_ lines:[String]) -> Int {
    var answer = 0
    let jobs = lines.map({ line -> Job in
        var splitLine = line.components(separatedBy: " ")
        splitLine[2].removeLast()
        
        let end = splitLine[1].components(separatedBy: ".")
        let hhmmss = end[0].components(separatedBy: ":")
        let sss = Int(end[1])!
        
        let endTime = (Int(hhmmss[0])! * 3600
                       + Int(hhmmss[1])! * 60
                       + Int(hhmmss[2])!
                      ) * 1000 + sss
        let duration = Int(Double(splitLine[2])! * 1000)
        
        return Job(
            start: endTime - duration + 1,
            end: endTime
        )
    })
    
    for job in jobs {
        let startDuration = job.start..<job.start+1000
        let endDuration = job.end..<job.end+1000
        answer = max(
            answer,
            jobs.filter({
                startDuration.contains($0.start)
                || startDuration.contains($0.end)
                || ($0.start...$0.end).overlaps(startDuration)}).count,
            jobs.filter({
                endDuration.contains($0.start)
                || endDuration.contains($0.end)
                || ($0.start...$0.end).overlaps(endDuration)}).count
        )
    }
    return answer
}

print(solution( [
    "2016-09-15 01:00:04.001 2.0s",
    "2016-09-15 01:00:07.000 2s"
]))

print(solution([
    "2016-09-15 01:00:04.002 2.0s",
    "2016-09-15 01:00:07.000 2s"
]))

print(solution([
    "2016-09-15 20:59:57.421 0.351s",
    "2016-09-15 20:59:58.233 1.181s",
    "2016-09-15 20:59:58.299 0.8s",
    "2016-09-15 20:59:58.688 1.041s",
    "2016-09-15 20:59:59.591 1.412s",
    "2016-09-15 21:00:00.464 1.466s",
    "2016-09-15 21:00:00.741 1.581s",
    "2016-09-15 21:00:00.748 2.31s",
    "2016-09-15 21:00:00.966 0.381s",
    "2016-09-15 21:00:02.066 2.62s"
]))
