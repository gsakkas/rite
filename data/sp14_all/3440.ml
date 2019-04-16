
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | h::t -> h + t;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | _ -> sumList (digitsOfInt n);;

*)

(* changed spans
(8,3)-(8,53)
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
CaseG (AppG (fromList [EmptyG])) (fromList [(ConPatG Nothing,Nothing,LitG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(8,3)-(8,53)
(8,48)-(8,53)
(8,52)-(8,53)
*)
