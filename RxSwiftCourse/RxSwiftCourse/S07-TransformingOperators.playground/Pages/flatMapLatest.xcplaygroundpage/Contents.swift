import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

// Flat Map: Similar to map
// Map a sequence to a only o  bject

struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()


student.asObserver()
    .flatMapLatest { $0.score.asObservable() }
    .subscribe(onNext: { (student) in
        print(student)
    })

student.onNext(john)
john.score.accept(100)

student.onNext(mary)
mary.score.accept(45)
