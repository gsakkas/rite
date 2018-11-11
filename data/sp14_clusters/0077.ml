
let pipe fs = let f a x c = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
x (let fn = fun d -> d in fn)
AppG [LetG NonRec [EmptyG] EmptyG]

(2,33)-(2,75)
x
VarG

(2,33)-(2,75)
d
VarG

(2,33)-(2,75)
fn
VarG

(2,33)-(2,75)
fun d -> d
LamG VarG

(2,33)-(2,75)
let fn = fun d -> d in fn
LetG NonRec [LamG EmptyG] VarG

*)
