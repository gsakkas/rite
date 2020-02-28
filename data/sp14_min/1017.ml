
let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base List.rev fs;;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,38)-(3,71)
List.fold_left f base
               (List.rev fs)
AppG [VarG,VarG,AppG [EmptyG]]

*)

(* type error slice
(3,38)-(3,52)
(3,38)-(3,71)
(3,60)-(3,68)
*)
