//: [Previous](@previous)

import Foundation
import RxSwift

let disposeBag = DisposeBag()

// Seems like PublishSubject but needs to put a initial value
let subject = BehaviorSubject(value: "Initial Value")

// The Behavior subject on subscribe get the last value sended
// In this case "before value" it is the last value before subscribe
subject.onNext("before Value")

subject.subscribe { event in
    print(event)
}

subject.onNext("after subcribe")

