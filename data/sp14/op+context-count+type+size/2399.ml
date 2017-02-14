
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = if b != (f b) then let b = f b in wwhile (f, b) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(7,24)-(7,34)
(7,40)-(7,68)
(7,55)-(7,61)
(7,55)-(7,68)
(7,62)-(7,68)
(7,63)-(7,64)
(7,74)-(7,75)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(5,16)-(5,25)
(5,17)-(5,18)
(7,40)-(7,68)
(7,48)-(7,49)
(7,48)-(7,51)
(7,55)-(7,61)
(7,55)-(7,68)
(7,62)-(7,68)
(7,63)-(7,64)
(7,66)-(7,67)
*)
