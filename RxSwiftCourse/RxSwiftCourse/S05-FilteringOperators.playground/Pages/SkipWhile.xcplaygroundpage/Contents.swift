import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Skip while: jumps all first items that:
//      are on conditioning of skip while
//      after one correct result, show all elements
Observable.of(2,2,2,3,4,4)
    .skipWhile { $0 % 2 == 0 }
    .subscribe(onNext: { (letter) in
        print(letter)
    }).disposed(by: disposeBag)
