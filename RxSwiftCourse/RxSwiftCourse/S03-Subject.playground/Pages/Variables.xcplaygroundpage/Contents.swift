import Foundation
import RxSwift

let disposeBag = DisposeBag()

// It will be deprecated
// Variable is used when needs to know every time the varible changed your content
// At this case, every tume that a variable add a value on array it's recived on subscribers
let variable = Variable([String]())
variable.value.append("One added")
variable.value.append("One Rwo added")

variable.asObservable()
    .subscribe {
        print($0)
}

variable.value.append("Two added")
