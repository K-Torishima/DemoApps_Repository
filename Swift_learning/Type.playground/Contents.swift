import UIKit

// Bool

let a: Bool = true
let b: Bool = false
let c: Bool = !a // false

// 理論積

let d = false && false // false
let e = false && true  // false
let f = true  && false // false
let g = true  && true  // true

// 理論和

let h = false || false // false
let i = false || true  // true
let j = true  || false // true
let k = true  || true  // true

// Int

let l = 123 // Int
let m = 1.0 // Double

// 数値型
/*
 - Int8
 - Int16
 - Int32
 - Int64
 */

// 浮動小数点

let n: Double = 123456789.1 // 123456789.1
let o: Float = 123456789.1  // 123456789e+08

// 無限大
let p: Double = 1.0 / 0.0
p.isInfinite // true

let q: Double = Double.infinity
q.isInfinite // true

// 非数

let r: Double = 0.0 / 0.0
r.isNaN // true

let s: Double = Double.nan
s.isNaN // true

// 数値であっても型が違おうとCompileError
