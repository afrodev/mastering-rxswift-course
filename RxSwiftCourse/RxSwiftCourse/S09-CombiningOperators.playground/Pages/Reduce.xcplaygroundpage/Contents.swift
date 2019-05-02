import UIKit
import RxSwift

let disposeBag = DisposeBag()

let source = Observable.of(1,2,3)

// Sum all elements from a observable sequence
source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


source.reduce(0, accumulator: {
    summary, newValue in
    return summary + newValue
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
