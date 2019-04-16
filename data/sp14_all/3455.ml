
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then
    (print_string "going into then" print_newline ();
     1
     ::
     x;
     additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then
    (print_string "going into then";
     1
     ::
     x;
     additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;

*)

(* changed spans
(15,6)-(15,53)
print_string "going into then"
AppG (fromList [LitG])

*)

(* type error slice
(15,6)-(15,18)
(15,6)-(15,53)
(16,6)-(18,7)
(16,6)-(19,51)
(20,8)-(20,27)
(20,9)-(20,15)
*)
