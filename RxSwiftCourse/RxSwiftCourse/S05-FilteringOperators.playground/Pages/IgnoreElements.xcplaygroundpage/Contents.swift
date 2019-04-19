import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()


// Ignore operator
let strikes = PublishSubject<String>()

// Ignore all data that has sended and
// it will call after completed event is called
strikes.ignoreElements().subscribe { element in
    print("Subscription is called \(element)")
}.disposed(by: disposeBag)


strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()
