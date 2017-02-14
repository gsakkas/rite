
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
(5,4)-(5,68)
(5,4)-(5,68)
(5,4)-(5,68)
(5,32)-(5,57)
(5,55)-(5,57)
(5,66)-(5,68)
*)
