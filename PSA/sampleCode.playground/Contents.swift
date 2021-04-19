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




class Yan {
    
    var result: Any?
    
    func fee() -> Any {
        
        if isChild() {
            result = ciledFee()
        } else if isSenior() {
            result = seniorFee()
        } else {
            result = adultFee()
        }
        return result
    }
    
    func fee2() {
        
        if isChild() {
            return ciledFee()
        } else if isSenior() {
            return seniorFee()
        } else {
            return adultFee()
        }
    }
    
    
    func fee3() -> Any {
        guard isChild() else { return ciledFee() }
        guard isSenior() else { return seniorFee() }
        return adultFee()
    }
    
    func ciledFee() {
        // 子供料金計算
    }
    
    func seniorFee() {
        // シニア料金計算
    }
    
    func adultFee() {
        // アダルト料金計算
    }
    
    func isChild() -> Bool {
        // 仮
        return false
    }
    
    func isSenior() -> Bool {
        // 仮
        return false
    }
}
