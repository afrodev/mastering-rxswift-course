import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Take: Take the first i elements on observable sequence
Observable.of(1,2,3,4,5)
    .take(2)
    .subscribe(onNext: { (letter) in
        print(letter)
    }).disposed(by: disposeBag)
