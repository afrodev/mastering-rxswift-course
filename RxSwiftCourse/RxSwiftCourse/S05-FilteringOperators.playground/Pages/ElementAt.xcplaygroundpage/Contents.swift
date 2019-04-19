import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()


// Element At operator
let strikes = PublishSubject<String>()

// Get the position in the event queue
strikes.elementAt(2).subscribe { element in
    print("You are out! \(element)")
    }.disposed(by: disposeBag)


strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()
