
let rec wwhile (f,b) = match b with | (e,boo) -> if boo = true then e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(2,24)-(2,72)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

*)

(* type error slice
(2,24)-(2,72)
(2,30)-(2,31)
(2,69)-(2,70)
(2,69)-(2,72)
(2,71)-(2,72)
*)
