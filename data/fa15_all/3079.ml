
let rec listReverse l =
  let rec listReverseHelper l =
    match l with | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;


(* fix

let rec listReverse l =
  let rec listReverseHelper l =
    function | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;

*)

(* changed spans
(4,5)-(4,66)
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
LamG VarPatG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(5,25)
(3,29)-(4,66)
(4,5)-(4,66)
(4,38)-(4,55)
(4,38)-(4,66)
*)
