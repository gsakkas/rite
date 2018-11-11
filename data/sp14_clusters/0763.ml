
let rec wwhile (f,b) =
  match b with | (e,boo) -> if boo = true then e else wwhile e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,2)-(3,64)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec [AppG [EmptyG]] (CaseG EmptyG [(Nothing,EmptyG)])

(3,8)-(3,9)
f
VarG

(3,8)-(3,9)
f b
AppG [VarG]

(3,28)-(3,64)
ans
VarG

(3,28)-(3,64)
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(3,54)-(3,64)
wwhile (f , num)
AppG [TupleG [EmptyG,EmptyG]]

(3,63)-(3,64)
(f , num)
TupleG [VarG,VarG]

*)
