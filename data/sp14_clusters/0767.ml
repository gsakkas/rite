
let rec wwhile (f,b) =
  match b with
  | (express,boo) -> if boo = true then wwhile (f, express) else express;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,2)-(4,72)
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

(4,21)-(4,72)
ans
VarG

(4,21)-(4,72)
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(4,65)-(4,72)
num
VarG

*)
