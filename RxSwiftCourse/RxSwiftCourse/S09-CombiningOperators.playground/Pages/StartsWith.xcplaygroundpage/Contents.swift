import UIKit
import RxSwift

let disposeBag = DisposeBag()
let numbers = Observable.of(2,3,4)

let observable = numbers.startWith(1)

// Starts With: Add a value on the beginning of the sequence
observable.subscribe (onNext:{ (event) in
    print(event)
})
