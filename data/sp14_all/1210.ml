
let rec wwhile (f,b) =
  match b with | (f',b') -> if b' then wwhile (f, f') else f';;


(* fix

let rec wwhile (f,b) =
  match f b with | (f',x') -> if x' then wwhile (f, f') else f';;

*)

(* changed spans
(3,3)-(3,62)
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,4)-(3,64)
(2,17)-(3,62)
(3,3)-(3,62)
(3,9)-(3,10)
(3,40)-(3,46)
(3,40)-(3,54)
(3,47)-(3,54)
(3,51)-(3,53)
*)
