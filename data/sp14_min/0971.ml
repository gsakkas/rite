
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,60)
fun i -> x (a i)
LamG VarPatG (AppG [EmptyG])

(4,14)-(4,16)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,60)
(3,11)-(3,60)
(3,15)-(3,60)
(3,35)-(3,48)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
