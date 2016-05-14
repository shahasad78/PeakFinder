//
// Created by Richard Martinez on 5/13/16.
// Copyright (c) 2016 PhantomUniversalMediaProductions. All rights reserved.
//

import Foundation


extension CollectionType where Generator.Element: Comparable, Index: RandomAccessIndexType {
    func findPeaks() -> [Generator.Element] {
        var idx = startIndex.successor()
        var results: [Generator.Element] = []

        while idx.advancedBy(2) <= endIndex {
            if self[idx.predecessor()] < self[idx] && self[idx.successor()] < self[idx] {
                results.append(self[idx])
                idx = idx.advancedBy(2)
            } else {
                idx = idx.successor()
            }
        }

        return results
    }
}

func findPeaksByOnes (unsortedArray: [Int]) -> [Int] {

    var peaksArray: [Int] = []

    for i in 1...unsortedArray.count - 2 {

        let value = unsortedArray[i]

        if unsortedArray[i - 1] < value && unsortedArray[i + 1] < value {

            print("Found peak of value \(value) at index \(i)")
            peaksArray.append(value)

        }

    }

    return peaksArray

}

func findPeaksByTwos (unsortedArray: [Int]) -> [Int] {

    var foundGreaterOnLastPass: Bool = false

    if unsortedArray[2] > unsortedArray[1] {
        foundGreaterOnLastPass = true
    }

    var i: Int = 3
    var peaksArray: [Int] = []

    while i < unsortedArray.count - 1 {

        let previousValue = unsortedArray[i - 1]
        let currentValue = unsortedArray[i]
        let nextValue = unsortedArray[i + 1]

        if previousValue > currentValue && foundGreaterOnLastPass {

            print("Found peak of value \(previousValue) at index \(i - 1)")
            peaksArray.append(previousValue)


        } else if currentValue > previousValue && currentValue > nextValue {

            print("Found peak of value \(currentValue) at index \(i)")
            peaksArray.append(currentValue)

        }

        if nextValue > currentValue {
            foundGreaterOnLastPass = true
        } else {
            foundGreaterOnLastPass = false
        }

        i += 2
    }

    let secondToLastValue: Int = unsortedArray[unsortedArray.count - 2]

    if foundGreaterOnLastPass && secondToLastValue > unsortedArray.last {

        print("Found peak of value \(secondToLastValue) at index \(unsortedArray.count - 1)")
        peaksArray.append(secondToLastValue)

    }

    return peaksArray

}
