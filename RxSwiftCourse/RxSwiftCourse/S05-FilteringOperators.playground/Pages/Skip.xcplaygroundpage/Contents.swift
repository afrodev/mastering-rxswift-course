import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

// Skip jumps the first i itens
Observable.of("A","B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext: { (letter) in
      print(letter)
    }).disposed(by: disposeBag)
