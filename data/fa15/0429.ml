
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f f (f (f b)) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt x = let xx = f (f (f (f b))) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;

*)

(* changed spans
(7,25)-(7,38)
f (f (f (f b)))
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,25)-(7,26)
(7,25)-(7,38)
(7,29)-(7,38)
(7,30)-(7,31)
*)
