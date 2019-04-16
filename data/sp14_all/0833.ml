
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
(5,5)-(5,69)
match res with
| (b' , c') -> if c'
               then acc b'
               else b'
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(5,5)-(5,69)
(5,33)-(5,58)
(5,56)-(5,58)
(5,67)-(5,69)
*)
