
let rec wwhile (f,b) =
  match f b with | (b',true ) -> f b' | (b',false ) -> b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,3)-(3,58)
match f b with
| (b' , c') -> if c'
               then wwhile (f , b')
               else b'
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(3,3)-(3,58)
(3,9)-(3,10)
(3,9)-(3,12)
(3,34)-(3,35)
(3,34)-(3,38)
(3,56)-(3,58)
*)
