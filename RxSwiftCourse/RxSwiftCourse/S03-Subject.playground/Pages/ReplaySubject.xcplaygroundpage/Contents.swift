//: [Previous](@previous)

import Foundation
import RxSwift

let disposeBag = DisposeBag()

// Replay Subject gets the last X values sended,
// In this case exists two
let subject = ReplaySubject<String>.create(bufferSize: 2)

subject.onNext("object 1")
subject.onNext("object 2")
subject.onNext("object 3")

subject.subscribe(onNext: { (event) in
    print(event)
})

subject.onNext("object 4")
subject.onNext("object 5")
subject.onNext("object 6")

// Second subscribe get the 5 and 6 object
print("[ Subscription 2 ]")
subject.subscribe { event in
    print(event)
}


