
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | (x,y) -> if x = b then (f, false) else (f, true) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | f -> if f = b then (f, false) else (f, true) in
     (g, b));;

*)

(* changed spans
(10,7)-(10,75)
(10,39)-(10,40)
*)

(* type error slice
(2,3)-(4,71)
(2,16)-(4,69)
(3,2)-(4,69)
(3,15)-(3,16)
(3,15)-(3,18)
(3,17)-(3,18)
(4,2)-(4,69)
(4,8)-(4,14)
(4,56)-(4,62)
(4,56)-(4,69)
(4,63)-(4,69)
(4,67)-(4,68)
(7,2)-(7,8)
(7,2)-(11,12)
(8,4)-(11,12)
(8,4)-(11,12)
(8,11)-(10,75)
(9,7)-(10,75)
(9,20)-(9,21)
(9,20)-(9,23)
(9,22)-(9,23)
(10,7)-(10,75)
(10,36)-(10,75)
(10,50)-(10,60)
(10,51)-(10,52)
(11,5)-(11,11)
(11,6)-(11,7)
*)
