
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt - 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(3,48)-(3,63)
digitsOfInt 1
AppG [LitG]

*)

(* type error slice
(3,3)-(3,63)
(3,16)-(3,18)
(3,22)-(3,63)
(3,36)-(3,42)
(3,48)-(3,63)
*)
