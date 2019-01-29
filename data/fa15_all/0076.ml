
let pipe fs =
  let f a x c d = d c in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
x
VarG

(3,18)-(3,19)
fun d -> d
LamG VarG

(3,18)-(3,19)
let fn = fun d -> d in fn
LetG NonRec (fromList [LamG EmptyG]) VarG

(3,20)-(3,21)
fn
VarG

*)
