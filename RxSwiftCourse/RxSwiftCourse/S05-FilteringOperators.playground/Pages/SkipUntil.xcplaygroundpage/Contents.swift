import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Skip Until: Waits a trigger send a event from another observable sequence
// And the event from trigger called, the subject (original observable sequence) begins to recieve de events
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")
subject.onNext("C")
