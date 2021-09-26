import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genreDict:[String:Int] = [:]
    var genrePlays:[(String, Int, Int)] = []
    
    for (index, (genre, play)) in zip(genres, plays).enumerated() {
        let count = genreDict[genre] ?? 0
        genreDict[genre] = count + play
        genrePlays.append((genre, play, index))
    }
    
    genrePlays.sort(by: { $0.1 > $1.1 })
    let sortedGenres = genreDict.sorted(by: { $0.value > $1.value })
    var bestAlbum:[Int] = []
    
    for sortedGenre in sortedGenres {
        let songs = genrePlays.filter({ $0.0 == sortedGenre.key }).prefix(2).map({ $0.2 })
        bestAlbum.append(contentsOf: songs)
    }
    return bestAlbum
}