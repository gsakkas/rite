
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  ((wwhile (let f' b = if (f b) = b then (b, false) else ((f b), true) in f')),
    b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f'), b);;

*)

(* changed spans
(6,11)-(6,77)
(let f' =
   fun b ->
     if f b = b
     then (b , false)
     else (f b , true) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)
