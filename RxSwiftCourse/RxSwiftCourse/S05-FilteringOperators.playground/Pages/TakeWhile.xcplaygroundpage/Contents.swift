import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// TakeWhile: take while the condition is true
//      after final of this condition no one element
//      it will showed


Observable.of(2,2,2,3,4,4)
    .takeWhile { $0 % 2 == 0 }
    .subscribe(onNext: { (letter) in
        print(letter)
    }).disposed(by: disposeBag)
