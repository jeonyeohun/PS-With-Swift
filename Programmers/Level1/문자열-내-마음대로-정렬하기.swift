func solution(_ strings:[String], _ n:Int) -> [String] {
    strings.sorted(){ (stringA, stringB) -> Bool in
        if Array(stringA)[n] == Array(stringB)[n] {
            return stringA < stringB
        }
        return Array(stringA)[n] < Array(stringB)[n]
    }
}