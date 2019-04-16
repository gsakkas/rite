
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (1, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,29)-(7,30)
b
VarG

(7,32)-(7,33)
b
VarG

(7,41)-(7,45)
b
VarG

(7,47)-(7,48)
b
VarG

*)

(* type error slice
(7,16)-(7,49)
(7,28)-(7,34)
(7,29)-(7,30)
(7,40)-(7,49)
(7,41)-(7,45)
*)
