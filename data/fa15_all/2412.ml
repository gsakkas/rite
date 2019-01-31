
let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let func a = match f b with | b -> (b, false) | x -> (x, true) in
     ((func f), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let g x = match f x with | x -> (x, false) | y -> (y, true) in (g, b));;

*)

(* changed spans
(7,18)-(7,67)
let g =
  fun x ->
    match f x with
    | x -> (x , false)
    | y -> (y , true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,24)-(7,27)
fun x ->
  match f x with
  | x -> (x , false)
  | y -> (y , true)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,24)-(7,27)
match f x with
| x -> (x , false)
| y -> (y , true)
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(7,26)-(7,27)
x
VarG

(7,41)-(7,42)
x
VarG

(7,59)-(7,60)
y
VarG

(8,12)-(8,13)
g
VarG

*)
