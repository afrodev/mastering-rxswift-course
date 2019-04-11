import Foundation
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

// The same of Varible, with one difference,
//    to change the content it is with accept function
//    to get current value you can get this on property value
let relay = BehaviorRelay(value: ["Item 1"])
relay.accept(relay.value + ["Item 2"])

relay.asObservable()
    .subscribe { event in
        print(event)
}
