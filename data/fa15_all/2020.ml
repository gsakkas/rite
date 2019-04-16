
let rec wwhile (f,b) =
  let rec helper (b',c') =
    match c' with
    | false  -> b'
    | true  -> let b' = b' + 1 in let c' = f b' in helper (b', c') in
  helper ((f b), (f b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,3)-(7,24)
let (b' , c') = f b in
match c' with
| false -> b'
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(7,24)
(3,19)-(6,67)
(4,5)-(6,67)
(4,11)-(4,13)
(6,25)-(6,27)
(6,25)-(6,31)
(7,3)-(7,9)
(7,3)-(7,24)
(7,10)-(7,24)
(7,11)-(7,16)
(7,12)-(7,13)
(7,18)-(7,23)
(7,19)-(7,20)
*)
