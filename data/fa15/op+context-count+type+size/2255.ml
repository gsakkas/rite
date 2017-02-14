
let rec wwhile (f,b) =
  let x = f b in
  let h::t = x in
  let r::l = t in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,2)-(5,69)
(4,2)-(5,69)
(4,13)-(4,14)
(5,2)-(5,69)
(5,13)-(5,14)
(5,24)-(5,25)
(5,43)-(5,44)
(5,56)-(5,69)
*)

(* type error slice
(5,2)-(5,69)
(5,2)-(5,69)
(5,13)-(5,14)
(5,18)-(5,69)
(5,18)-(5,69)
(5,18)-(5,69)
(5,18)-(5,69)
(5,24)-(5,25)
*)
