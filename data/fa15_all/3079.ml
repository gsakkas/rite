
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
(4,4)-(4,65)
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,10)-(4,11)
$x
VarG

*)
