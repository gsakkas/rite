
let pipe fs = let f a x n = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> a) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
(fun n -> a) x
AppG (fromList [VarG])

(2,33)-(2,75)
x
VarG

*)
