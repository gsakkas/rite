
let pipe fs =
  let f a x = x a in
  let base = match fs with | (fn,n) -> n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let piper fn n =
    let f a x = x a in let base = n in List.fold_left f base fs in
  piper fs;;

*)

(* changed spans
(3,3)-(4,69)
(3,9)-(3,18)
(4,3)-(4,69)
(4,14)-(4,41)
(4,20)-(4,22)
*)

(* type error slice
(4,14)-(4,41)
(4,20)-(4,22)
(4,45)-(4,59)
(4,45)-(4,69)
(4,67)-(4,69)
*)
