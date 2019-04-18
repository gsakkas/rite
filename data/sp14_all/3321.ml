
let rec mulByDigit i l =
  match List.rev l with
  | []::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | _::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(3,3)-(7,60)
match List.rev l with
| _ :: [] -> []
| h :: m :: t -> mulByDigit i
                            (m :: t) @ [((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
CaseG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,AppG (fromList [EmptyG])),(ConsPatG WildPatG (ConPatG Nothing),Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(7,60)
(7,11)-(7,18)
(7,12)-(7,13)
*)
