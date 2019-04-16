
let rec wwhile (f,b) =
  match b with | (e,boo) -> if boo = true then e else wwhile e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,3)-(3,65)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

*)

(* type error slice
(2,4)-(3,67)
(2,17)-(3,65)
(3,3)-(3,65)
(3,9)-(3,10)
(3,55)-(3,61)
(3,55)-(3,65)
(3,62)-(3,63)
*)
