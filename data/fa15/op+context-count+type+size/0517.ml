
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let result = f b in if result = b then b else wwhile (f, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,2)-(5,61)
(5,15)-(5,18)
(5,41)-(5,42)
(5,48)-(5,54)
(5,48)-(5,61)
(5,56)-(5,57)
(5,59)-(5,60)
*)

(* type error slice
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(5,2)-(5,61)
(5,15)-(5,16)
(5,15)-(5,18)
(5,25)-(5,31)
(5,25)-(5,35)
(5,25)-(5,35)
(5,34)-(5,35)
(5,48)-(5,54)
(5,48)-(5,61)
(5,55)-(5,61)
(5,56)-(5,57)
(5,59)-(5,60)
*)
