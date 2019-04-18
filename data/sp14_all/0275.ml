
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> ([n mod 10], (digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,3)-(3,69)
if n <= 0
then []
else (n mod 10) :: (digitsOfInt (n / 10))
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,69)
(3,23)-(3,25)
(3,33)-(3,69)
*)
