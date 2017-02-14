
let pipe fs =
  let f a x = match x with | [] -> (fun b  -> b) in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,48)
(3,21)-(3,22)
(3,37)-(3,48)
(4,3)-(4,43)
(4,14)-(4,15)
*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,48)
(3,11)-(3,48)
(3,15)-(3,48)
(3,37)-(3,48)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
