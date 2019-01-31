
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = func b in (result, (result = b)) in
      helper f), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper b' = let result = f b' in (result, (result = b')) in helper),
      b);;

*)

(* changed spans
(7,17)-(7,69)
fun b' ->
  (let result = f b' in
   (result , result = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,42)-(7,43)
f
VarG

(7,47)-(7,69)
b'
VarG

(8,6)-(8,14)
b'
VarG

*)
