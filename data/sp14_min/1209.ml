
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let helper = if (f b) = b then ((f b), true) else ((f b), false) in
     (helper, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(7,5)-(8,18)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(6,3)-(6,9)
(6,3)-(8,18)
(7,5)-(8,18)
(7,19)-(7,70)
(7,56)-(7,70)
(8,6)-(8,17)
(8,7)-(8,13)
*)
