
let pipe fs = let f a x n = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
(fun n -> n) a
AppG (fromList [VarG])

(2,28)-(2,29)
n
VarG

*)
