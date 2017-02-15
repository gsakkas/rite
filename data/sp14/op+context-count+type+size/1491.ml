
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
(7,28)-(8,52)
(8,2)-(8,52)
(8,8)-(8,19)
(8,8)-(8,21)
(8,20)-(8,21)
(8,35)-(8,36)
(8,51)-(8,52)
*)

(* type error slice
(8,2)-(8,52)
(8,2)-(8,52)
(8,47)-(8,52)
(8,51)-(8,52)
*)
