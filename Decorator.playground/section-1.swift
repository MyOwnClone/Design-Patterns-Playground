// 
// # Motivation
//
// TODO: Explain sad truth
//
// Classes should be open for extension, but close for modification.
//
// # Definition
// 
// The Decorator pattern attaches additional responsibilities to an object
// dynamically. Provide a flexible alternative to subclassing for extending
// functionality.

// # Coffee shop example


protocol Beverage: Printable {
    func cost() -> Double
}

class HouseBlend: Beverage {
    
    var description : String {
        return "House Blend"
    }
    
    func cost() -> Double  {
        return 15.0
    }
}

class Espresso: Beverage {

    var description : String {
        return "Espresso"
    }
    
    func cost() -> Double  {
        return 20.0
    }
}

class CondimentDecorator: Beverage {
    let beverage: Beverage
    init (_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return beverage.cost() + 5.0
    }
    
    var description: String {
        fatalError("Descriotion should be overrided")
        return beverage.description
    }
    
}

class Milk: CondimentDecorator {
    override var description : String {
        return beverage.description + ", Milk"
    }
    
    override func cost() -> Double {
        return beverage.cost() + 3.0
    }
}

class Mocha: CondimentDecorator {
    override var description : String {
        return beverage.description + ", Mocha"
    }
    
    override func cost() -> Double {
        return beverage.cost() + 4.5
    }
}


println("Wellcome to Coffeshop")


let espresso = Espresso()
println("Your \(espresso.description), please. It is \(espresso.cost())")

let mix = Mocha(Milk(HouseBlend()))

println("Your \(mix.description), please. It is \(mix.cost())")

