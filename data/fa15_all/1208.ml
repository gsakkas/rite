
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,24)-(2,70)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,24)-(2,70)
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,70)
(2,67)-(2,68)
(2,67)-(2,70)
(2,70)-(2,70)
*)
