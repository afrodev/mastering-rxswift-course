import UIKit
import RxSwift

let disposeBag = DisposeBag()

// Merge: Merge two sequence by arrival order

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(
    left.asObservable(),
    right.asObservable()
)

let observable = source.merge()
observable.subscribe(onNext: { (result) in
    print(result)
}).disposed(by: disposeBag)

left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)
