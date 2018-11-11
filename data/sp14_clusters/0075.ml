
let pipe fs = let f a x c = c x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,35)-(2,77)
d
VarG

(2,35)-(2,77)
fn
VarG

(2,35)-(2,77)
fun d -> d
LamG VarG

(2,35)-(2,77)
let fn = fun d -> d in fn
LetG NonRec [LamG EmptyG] VarG

*)
