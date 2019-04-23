import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Transforms sequence to an array
Observable.of(1,2,3,4,5)
    .toArray()
    .subscribe(onNext: { (array) in
        print(array)
    })
