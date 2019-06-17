
let pipe fs =
  let f a x = match a with | [] -> x | _ -> x a in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,48)
fun i -> x (a i)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,16)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,15)-(3,48)
(3,36)-(3,37)
(3,45)-(3,46)
(3,45)-(3,48)
*)
