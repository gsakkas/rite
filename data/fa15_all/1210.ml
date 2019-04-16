
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,24)-(2,78)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,24)-(2,78)
(2,30)-(2,31)
(2,30)-(2,33)
(2,50)-(2,78)
(2,68)-(2,69)
(2,75)-(2,76)
(2,75)-(2,78)
*)
