
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if (wwhile (f, b)) = b then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(6,10)-(6,67)
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
TupleG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG,VarG]

*)

(* type error slice
(6,10)-(6,67)
(6,39)-(6,40)
(6,46)-(6,66)
(6,64)-(6,65)
*)
