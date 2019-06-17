
let rec digitsOfInt n =
  let return = [] in if n != 0 then (n mod 10) digitsOfInt 0 else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(3,37)-(3,61)
(n mod 10) :: return
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(3,37)-(3,47)
(3,37)-(3,61)
*)
