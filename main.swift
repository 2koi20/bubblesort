import Foundation

var global = 0
func progress(_ asciiList: [Float]) {
    var cache: Float = 1000
    var count: Int = 0
    for i in asciiList {
        if (i<cache) {
            cache = i
            count += 1
            global += 1
        }
    }
    print(count, global)
}

func toASCII(_ wordList: [String]) -> [Float] {
    var ASCIIList: [Float] = []
    for i in wordList {
        var ASCII: Float = 0
        var count = 0
        for x in i.utf8 {
            
            ASCII += Float(x)/pow(1000.0, Float(count))
            count += 1
        }
        ASCIIList.append(ASCII)
    }
    return(ASCIIList)
}
func bubble(_ wordList: [String]) {
    var outList = wordList
    var array = toASCII(wordList)
    var n = array.count
    while (n > 0) {
        var lastModifiedIndex = 0
        for currentIndex in 1..<n {
            if array[currentIndex - 1] > array[currentIndex] {
                let temp = array[currentIndex - 1]
                let tempWord = outList[currentIndex - 1] 
                array[currentIndex - 1] = array[currentIndex]
                array[currentIndex] = temp
                outList[currentIndex - 1] = outList[currentIndex]
                outList[currentIndex] = tempWord
                lastModifiedIndex = currentIndex
            }
            
        }
        n = lastModifiedIndex
        progress(array)
        if global > 2000000 {
            n = 0
            var xey = ""
            for x in outList {
                xey.append("\(x)\n")
            }
            print(xey)
        }
    }
    if global < 2000000 {
        print(outList)
    }
}




var unsortedString = [""]
while let input = readLine() {
    if input.rangeOfCharacter(from: .decimalDigits) == nil {
    unsortedString.append(input)
    }
}
unsortedString.removeFirst()
bubble(unsortedString)
