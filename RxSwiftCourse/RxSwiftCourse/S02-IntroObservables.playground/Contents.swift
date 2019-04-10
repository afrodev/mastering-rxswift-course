

import UIKit
import RxSwift

_ = Observable.from([11,1,3,4123,123,4,5])

let observableOne = Observable.just(1)
let observableTwo = Observable.of(1,2,3,4,5)
let observableThree = Observable.of([1,2,3,4,5])
let observableFour = Observable.from([1,2,3,4,5])

// Observable "of" sends the object, not the content
// If you sends a array you will get one event with a completed array
observableThree.subscribe { (event) in
    if let element = event.element {
        print("OF OBSERVABLE \(element)")
    }
    
}

// Observable "from" that recieves a array,
// sends each object on array to event individually
observableFour.subscribe { (event) in
    if let element = event.element {
        print("FROM OBSERVABLE: \(element)")
    }
    
}

// No need to unwrap element
observableFour.subscribe(onNext: { element in
    print("on next FROM OBSERVABLE: \(element)")
})


// Remove and avoid memory leaks you need to add a dispose bag
// to handle with multiples subscribers
let disposeBag = DisposeBag()
Observable.of("A", "B", "C")
    .subscribe {
        print($0)
}.disposed(by: disposeBag)


// Creating a observable
Observable<String>.create { (observer) -> Disposable in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    
    // Different way to create a disposable
    return Disposables.create()
}.subscribe(onNext: {
    print($0)
}, onError: {
    print($0)
}, onCompleted: {
    print("completed")
}, onDisposed: {
    print("disposed")
}).disposed(by: disposeBag)

