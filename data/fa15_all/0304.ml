
let pipe fs =
  let f a x n = a + x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
(fun n -> n) a
AppG (fromList [VarG])

(3,16)-(3,21)
n
VarG

*)
