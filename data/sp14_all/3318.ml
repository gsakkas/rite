
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      [(mulByDigit m)
      ::
      t;
      ((h * i) / 10) + ((m * i) mod 10);
      (h * i) mod 10];;


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
mulByDigit i
           (m :: t) @ [((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(6,8)-(6,18)
(@)
VarG

(6,8)-(6,18)
mulByDigit i (m :: t)
AppG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(6,19)-(6,20)
i
VarG

(6,19)-(6,20)
m :: t
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(9,6)-(9,39)
[((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
