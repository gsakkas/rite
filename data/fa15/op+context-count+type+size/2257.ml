
let rec wwhile (f,b) =
  let x = f b in
  let h::t = x in
  let r::l = t in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,3)-(5,69)
(4,3)-(5,69)
(4,14)-(4,15)
(5,3)-(5,69)
(5,14)-(5,15)
(5,25)-(5,26)
(5,44)-(5,45)
(5,57)-(5,69)
*)

(* type error slice
(5,3)-(5,69)
(5,3)-(5,69)
(5,14)-(5,15)
(5,19)-(5,69)
(5,19)-(5,69)
(5,19)-(5,69)
(5,19)-(5,69)
(5,25)-(5,26)
*)
