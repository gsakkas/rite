
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile (fun xx  -> ((xx, ((f xx) = xx)), b));;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) = xx))), b);;

*)

(* changed spans
(8,29)-(8,66)
(fun xx ->
   (xx , f xx = xx) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(2,4)-(6,10)
(2,17)-(6,8)
(8,22)-(8,28)
(8,22)-(8,66)
(8,29)-(8,66)
*)
