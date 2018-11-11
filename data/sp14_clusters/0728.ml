
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile
    (let g y x =
       let sec s fi m = if s = fi then (s, (s = (m s))) else (s, false) in
       sec (y x) x in
     ((g f b), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
x
VarG

(2,16)-(3,62)
fun x -> (x * x , x < 100)
LamG (TupleG [EmptyG,EmptyG])

(2,16)-(3,62)
x * x
BopG VarG VarG

(2,16)-(3,62)
x < 100
BopG VarG LitG

(2,16)-(3,62)
100
LitG

(2,16)-(3,62)
(x * x , x < 100)
TupleG [BopG EmptyG EmptyG,BopG EmptyG EmptyG]

(10,11)-(10,12)
h
VarG

*)
