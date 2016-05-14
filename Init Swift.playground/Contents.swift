import Foundation

class Student1 {
    var firstName : String
    var lastName : String
    var fullName : String {
        return firstName + " " + lastName
    }
    
    init() {
        firstName = String()
        lastName = String()
    }
}



class Student2 {
    var firstName = ""
    var lastName = ""
}

class Student3 {
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student4 {
    var middleName : String?
}

class Student5 {
    let maxAge : Int
    
    init() {
        maxAge = 100
    }
}

//class Student6: Student5 {
//    override init() {
//        maxAge = 110
//    }
//}

struct Student7 {
    var firstName : String
    var lastName : String
    init() {
        firstName = ""
        lastName = ""
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let s1 = Student1()
let s2 = Student2()
let s3 = Student3(firstName: "AL", lastName: "Kirk")
let s5 = Student5()
let s7 = Student7(firstName: "John", lastName: "Feris")


/////////////////

class Human {
    var weight : Int
    var age : Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {
        
    }
    
    deinit {
        print("Human deinitialized")
    }
}

let h1 = Human(weight: 70, age: 25)
let h2 = Human(weight: 70, age: 25)
let h3 = Human()

class Student: Human {
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        test()
        self.weight = 99
    }
    
    override convenience init(weight: Int, age: Int) {
        self.init(firstName: "")
        self.weight = weight
        self.age = age
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 25
        self.weight = 50
        test()
    }
    
    
}

let student = Student(firstName: "a", lastName: "2")
let student2 = Student(firstName: "2")

class Doctor: Student {
    var fieldOfStudy : String
//    
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firstName: "Doctor", lastName: "House")
    }
    
//    override init(weight: Int, age: Int) {
//        self.fieldOfStudy = ""
//        super.init(weight: weight, age: age)
//    }
    
    override init(firstName: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(firstName: firstName, lastName:  lastName)
    }
//    convenience init(fieldOfStudy: String) {
//        self.init(firstName: "Doctor", lastName: "House")
//        self.fieldOfStudy = fieldOfStudy
//    }
    convenience init(firstName: String) {
        self.init(fieldOfStudy: "Math")
        self.age = 35
        self.firstName = firstName
    }
}

let stu1 = Student()

let d1 = Doctor(firstName: "aaa")
d1.age

print(d1.age)

////////////////////

enum Color : Int {
    case Black
    case White
    
    init?(_ value : Int) {
        switch  value {
        case 0:
            self = Black
        case 1:
            self = White
        default:
            return nil
        }
    }
}

let a = Color(-1)
//a!.rawValue

let b = Color(rawValue: 0)

struct  Size {
    var width : Int
    var height : Int
    
    init?(width: Int, height: Int) {
        self.width = width
        if  height < 0 {
            return nil
        }
        self.height = height
    }
}


class Friend : Human {
    
    var name : String!
    
    let skin : Color = {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    }()
    
    init?(name: String) {
        self.name = name
        
        super.init(weight: 0, age: 0)
        if name.isEmpty {
            return nil
        }
        
    }
    
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("Friend deinitialized")
    }
}

let f = Friend(name: "0")
f!.name

class BestFriend : Friend {
    
    
    override init(name: String) {
        
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
        
        
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    deinit {
        print("BestFriend deintitialized")
    }
    
}

let bf = BestFriend(name: "j")

let f1 = Friend(name: "a")
f1!.skin.rawValue

let f2 = Friend(name: "b")
f2!.skin.rawValue

let f3 = Friend(name: "c")
f3!.skin.rawValue

let f4 = Friend(name: "d")
f4!.skin.rawValue

struct Test {
    var bestFriend : BestFriend? = BestFriend(name: "")
}

var test : Test? = Test()

test!.bestFriend = nil

var f5 = Friend(name: "")

class Address {
    
    var street = "Deribasovskaya"
    var number = "1"
    var city = "Odessa"
    var country = "Ukraine"
}

struct Garage {
    var size = 2
}

class House {
    
    var rooms = 1
    var address = Address()
    var garage : Garage? = Garage()
}

class Car {
    var model = "Zaporojec"
    
    func start() {
        
    }
}

class Person {
    var cars : [Car]? = [Car()]
    var house : House? = House()
}

let p = Person()

p.cars![0]
p.house!

p.house!.garage!.size

if let house = p.house {
    if let garage = house.garage {
        garage.size
    }
}

p.house?.garage?.size

