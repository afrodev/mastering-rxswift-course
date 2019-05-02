import UIKit
import RxSwift

let disposeBag = DisposeBag()

let source = Observable.of(1,2,3)

// Same as Reduce, but the accumulator is called after each operation
// 1, 1 with 2 = 3, 3 with 3 = 6
source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
