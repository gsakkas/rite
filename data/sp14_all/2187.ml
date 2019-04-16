
let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile (fun x  -> let b = f x in ((b, (b != x)), b));;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(6,29)-(6,74)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(4,56)-(4,62)
(4,56)-(4,69)
(4,63)-(4,69)
(6,22)-(6,28)
(6,22)-(6,74)
(6,29)-(6,74)
*)
