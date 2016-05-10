class Student1 {
    var firstName : String
    var lastName : String
    var fullName : String {
        return firstName + " " + lastName
    }
    
    init() {
        self.firstName = String()
        self.lastName = String()
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

class Student6: Student5 {
    override init() {
        maxAge = 110
    }
}

let s1 = Student1()
let s2 = Student2()
let s3 = Student3(firstName: "AL", lastName: "Kirk")
let s5 = Student5()