import UIKit
import RxSwift


let disposeBag = DisposeBag()

// 
// The subject can send a event of any place
// When subject is subscribed, it's not recieved the "A" value
// otherwise X and K is recieved
let subject = PublishSubject<String>()
subject.onNext("A: before subscribe")
subject.subscribe{ event in
    print(event)
}

subject.onNext("X: after subscribe")
subject.onNext("K: after subscribe")

// After disposed will not called
subject.dispose()
subject.onNext("Z: after disposed")

// After completed can not be called again like dispose
subject.onCompleted()
subject.onNext("Z: after completed")
