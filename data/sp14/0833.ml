
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' | b' -> b' in
  acc b;;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

*)

(* changed spans
(5,4)-(5,68)
(5,66)-(5,68)
*)

(* type error slice
(5,4)-(5,68)
(5,32)-(5,57)
(5,55)-(5,57)
(5,66)-(5,68)
*)

(* all spans
(2,16)-(6,7)
(3,2)-(6,7)
(3,14)-(5,68)
(4,4)-(5,68)
(4,14)-(4,22)
(4,14)-(4,15)
(4,16)-(4,22)
(5,4)-(5,68)
(5,10)-(5,13)
(5,32)-(5,57)
(5,35)-(5,37)
(5,43)-(5,49)
(5,43)-(5,46)
(5,47)-(5,49)
(5,55)-(5,57)
(5,66)-(5,68)
(6,2)-(6,7)
(6,2)-(6,5)
(6,6)-(6,7)
*)
