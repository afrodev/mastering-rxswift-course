import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Filter operator
Observable.of(1,2,3,4,5,6,7)
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: { (number) in
        print(number)
    }).disposed(by: disposeBag)

