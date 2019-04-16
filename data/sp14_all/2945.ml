
let pipe fs =
  let f a x = match x with | [] -> (fun b  -> b) in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,49)
fun y -> a (x y)
LamG VarPatG (AppG (fromList [EmptyG]))

(4,14)-(4,15)
fun b -> b
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,49)
(3,11)-(3,49)
(3,15)-(3,49)
(3,36)-(3,49)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
