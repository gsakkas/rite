
let rec wwhile (f,b) =
  match (f, b) with
  | (func,param) -> if param = true then f param else 0
  | _ -> b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,3)-(5,11)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(5,11)
(3,9)-(3,15)
(3,13)-(3,14)
(4,21)-(4,56)
(4,24)-(4,29)
(4,24)-(4,36)
(4,32)-(4,36)
(4,55)-(4,56)
(5,10)-(5,11)
*)
