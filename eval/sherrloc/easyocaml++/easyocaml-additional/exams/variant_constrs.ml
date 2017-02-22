(*S*)

type t = A | B of int | C of int * int | D of (int * int)

let x = A, B 2, C (2,3), D (2,3)
let y = let p = (2,3) in D p

let f = function B n -> n 
let g = function C (m,n) -> m,n
let h = function D x -> x
let k = function C _ | D _ -> ()
