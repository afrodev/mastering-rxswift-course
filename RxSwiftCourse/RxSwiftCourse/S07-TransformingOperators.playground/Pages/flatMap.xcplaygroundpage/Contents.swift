import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

// Flat Map: Similar to map
// Map a sequence to a only object

struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

// You can observe a variable of a scruct, this is awesome
student.asObserver()
    .flatMap { $0.score.asObservable() }
    .subscribe(onNext: { (student) in
        print(student)
    })

student.onNext(john)
john.score.accept(10)

student.onNext(mary)
mary.score.accept(85)


john.score.accept(33)
