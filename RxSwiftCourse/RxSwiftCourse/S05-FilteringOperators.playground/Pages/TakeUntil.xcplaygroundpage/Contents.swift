import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Take until: When the trigger has not recieved then show
//      all elements on observable sequence after trigger
//      it will not show nothing
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")
subject.onNext("C")
