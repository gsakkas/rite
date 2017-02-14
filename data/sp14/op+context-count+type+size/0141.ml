
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | b -> if f = b then (f, false) else (f, true) in
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
(10,8)-(10,71)
*)

(* type error slice
(2,4)-(4,72)
(2,17)-(4,69)
(3,3)-(4,69)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(4,3)-(4,69)
(4,9)-(4,15)
(4,57)-(4,63)
(4,57)-(4,69)
(4,65)-(4,69)
(4,68)-(4,69)
(7,3)-(7,9)
(7,3)-(11,11)
(8,6)-(11,11)
(8,6)-(11,11)
(8,12)-(10,71)
(9,8)-(10,71)
(9,8)-(10,71)
(9,21)-(9,22)
(9,21)-(9,24)
(9,23)-(9,24)
(10,8)-(10,71)
(10,8)-(10,71)
(10,14)-(10,20)
(10,33)-(10,71)
(10,36)-(10,37)
(10,36)-(10,41)
(10,36)-(10,41)
(10,40)-(10,41)
(10,48)-(10,49)
(10,48)-(10,56)
(11,7)-(11,8)
(11,7)-(11,11)
*)
