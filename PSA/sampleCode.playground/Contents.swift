import Foundation

struct Cat {
    
    private (set) var name: String?
    
    func meow() {
        print("吾輩は猫である")
        guard name != nil else { return notName() }
        getName(name: name!)
    }
    
    func notName() {
        print("名前はまだ無い。")
    }
    
    func getName(name: String) {
        print("名前は " + name + "だ")
    }
}

let cat = Cat()
cat.meow()

let dora = Cat(name: "ドラ")
dora.meow()

let tama = Cat(name: "たま")
tama.meow()



