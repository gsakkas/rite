
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
(10,8)-(10,76)
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
CaseG (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,4)-(4,72)
(2,17)-(4,70)
(3,3)-(4,70)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(4,3)-(4,70)
(4,9)-(4,15)
(4,57)-(4,63)
(4,57)-(4,70)
(4,64)-(4,70)
(4,68)-(4,69)
(7,3)-(7,9)
(7,3)-(11,13)
(8,5)-(11,13)
(8,12)-(10,76)
(9,8)-(10,76)
(9,21)-(9,22)
(9,21)-(9,24)
(9,23)-(9,24)
(10,8)-(10,76)
(10,37)-(10,76)
(10,67)-(10,76)
(10,68)-(10,69)
(11,6)-(11,12)
(11,7)-(11,8)
*)
