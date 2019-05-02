import UIKit
import RxSwift

let disposeBag = DisposeBag()

let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

let observable = button.withLatestFrom(textField)
let diposable = observable.subscribe(onNext: {
    print($0)
})

// Gets the latest value from a observable

textField.onNext("Sw")
textField.onNext("Swif")
textField.onNext("Swift")
button.onNext(())

textField.onNext("Swift Rocks!")

button.onNext(())
