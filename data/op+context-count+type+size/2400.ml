
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b)
  then let f b = (b, true) in wwhile (f, (f b))
  else wwhile (f b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,6)-(8,15)
(9,8)-(9,46)
(9,14)-(9,26)
(9,19)-(9,20)
(9,19)-(9,26)
(9,22)-(9,26)
(9,31)-(9,37)
(9,39)-(9,46)
(9,43)-(9,46)
(10,8)-(10,19)
(10,16)-(10,19)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,44)-(4,45)
(4,44)-(4,47)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(8,6)-(8,7)
(8,6)-(8,15)
(8,6)-(8,15)
(8,12)-(8,13)
(8,12)-(8,15)
(9,31)-(9,37)
(9,31)-(9,46)
(9,39)-(9,40)
(9,39)-(9,46)
(9,43)-(9,44)
(9,43)-(9,46)
(9,45)-(9,46)
(10,8)-(10,14)
(10,8)-(10,19)
(10,16)-(10,17)
(10,16)-(10,19)
*)
