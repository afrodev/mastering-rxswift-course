import UIKit
import RxSwift

let disposeBag = DisposeBag()

// CombineLatest: Get always the lastest value of a observable sequence from a array of sequences.
// Shows the lastest value every time that event arrive

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left,right, resultSelector: { lastLeft, lastRight in
    
    "\(lastLeft) \(lastRight)"
})

let disposable = observable.subscribe { (value) in
    print(value)
}

left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(1)
right.onNext(2)


