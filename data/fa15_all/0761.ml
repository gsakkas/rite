
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
(3,8)-(3,14)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,9)-(3,10)
f b
AppG (fromList [VarG])

(4,20)-(4,55)
ans
VarG

(4,20)-(4,55)
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(4,23)-(4,28)
boo
VarG

(4,41)-(4,42)
wwhile
VarG

(4,41)-(4,42)
(f , num)
TupleG (fromList [VarG])

(5,9)-(5,10)
num
VarG

*)
