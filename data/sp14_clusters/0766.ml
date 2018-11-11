
let rec wwhile (f,b) = match b with | (e,boo) -> if boo = true then e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(2,23)-(2,71)
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
LetG NonRec [AppG [EmptyG]] (CaseG EmptyG [(Nothing,EmptyG)])

(2,29)-(2,30)
f
VarG

(2,29)-(2,30)
f b
AppG [VarG]

(2,49)-(2,71)
ans
VarG

(2,49)-(2,71)
wwhile
VarG

(2,49)-(2,71)
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

*)
