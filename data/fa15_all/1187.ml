
let rec wwhile (f,b) = match b with | b -> wwhile f b;;


(* fix

let rec wwhile (f,b) =
  match b with | b -> if (f b) = (b, true) then wwhile (f, b);;

*)

(* changed spans
(2,44)-(2,54)
if f b = (b , true)
then wwhile (f , b)
else ()
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (ConAppG Nothing)

*)

(* type error slice
(2,4)-(2,56)
(2,17)-(2,54)
(2,44)-(2,50)
(2,44)-(2,54)
(2,51)-(2,52)
*)
