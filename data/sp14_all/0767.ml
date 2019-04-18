
let rec wwhile (f,b) =
  match b with
  | (express,boo) -> if boo = true then wwhile (f, express) else express;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,3)-(4,73)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

*)

(* type error slice
(2,4)-(4,75)
(2,17)-(4,73)
(3,3)-(4,73)
(3,9)-(3,10)
(4,41)-(4,47)
(4,41)-(4,60)
(4,48)-(4,60)
(4,52)-(4,59)
*)
