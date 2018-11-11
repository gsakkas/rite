
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit m) :: t) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,7)-(6,21)
mulByDigit i (m :: t)
AppG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(6,19)-(6,20)
i
VarG

(6,19)-(6,20)
m :: t
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)
