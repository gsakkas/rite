
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
    ((print_string "going into then") / (print_newline ());
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
(15,5)-(15,58)
(15,40)-(15,58)
(15,41)-(15,54)
(15,55)-(15,57)
*)

(* type error slice
(15,4)-(19,51)
(15,5)-(15,37)
(15,5)-(15,58)
(15,5)-(15,58)
(15,5)-(15,58)
(15,6)-(15,18)
(15,40)-(15,58)
(15,41)-(15,54)
(16,5)-(18,6)
(16,5)-(19,50)
(20,7)-(20,26)
(20,8)-(20,14)
*)
