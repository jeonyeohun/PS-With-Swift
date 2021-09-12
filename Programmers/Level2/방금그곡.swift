import Foundation

func stringToNoteArray(from notes: String) -> String {
    var notesplit: [String] = []
    let sharpNote = ["C#": "1", "D#" : "2", "F#" : "3", "G#" : "4", "A#" : "5"]
    for note in notes {
        if note == "#" {
            notesplit[notesplit.count - 1] = sharpNote[notesplit.last! + String(note)] ?? "X"
        } else {
            notesplit.append(String(note))
        }
    }
    return notesplit.joined()
}

func timeFormatToMins(from time: String) -> Int {
    let timeSplit = time.components(separatedBy: ":")
    return Int(timeSplit[0])! * 60 + Int(timeSplit[1])!
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var matchedMusic: (runningTime: Int, title: String) = (0, "(None)")
    let savedNotes = stringToNoteArray(from: m)
    for musicinfo in musicinfos {
        let splitInfo = musicinfo.components(separatedBy: ",")
        let runningTime = timeFormatToMins(from: splitInfo[1]) - timeFormatToMins(from: splitInfo[0])
        let title = splitInfo[2]
        let notes = Array(stringToNoteArray(from: splitInfo[3]))
        
        var playedNotes: String = ""
        for i in 0..<runningTime  {
            playedNotes.append(notes[i % notes.count])
        }
        
        if playedNotes.contains(savedNotes)
        && matchedMusic.runningTime < runningTime {
            matchedMusic = (runningTime, title)
        }
    }
    return matchedMusic.title
}