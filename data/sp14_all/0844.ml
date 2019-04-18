
let rec listReverse l =
  match l with | [] -> l | (other::tail::[])::[] -> tail :: other;;


(* fix

let rec listReverse l =
  let rec listReverseHelper l ans =
    match ans with | [] -> [] | h::t -> listReverseHelper t (h :: ans) in
  listReverseHelper l [];;

*)

(* changed spans
(3,3)-(3,66)
let rec listReverseHelper =
  fun l ->
    fun ans ->
      match ans with
      | [] -> []
      | h :: t -> listReverseHelper t
                                    (h :: ans) in
listReverseHelper l []
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,10)
(3,24)-(3,25)
(3,53)-(3,57)
(3,53)-(3,66)
(3,61)-(3,66)
*)
