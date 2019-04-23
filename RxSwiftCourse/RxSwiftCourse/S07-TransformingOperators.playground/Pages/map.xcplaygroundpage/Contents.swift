import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Each element from sequence can be tranformed to another

Observable.of(1,2,3,5,6)
    .map {
        return $0 * 2
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
