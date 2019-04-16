
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs2 with | [] -> xs1 | hd::tl -> append (xs1 :: hd) tl in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(4,44)-(4,65)
hd :: (append tl xs2)
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(3,3)-(7,11)
(3,18)-(4,65)
(4,5)-(4,65)
(4,44)-(4,50)
(4,44)-(4,65)
(4,51)-(4,62)
(4,52)-(4,55)
(4,59)-(4,61)
(4,63)-(4,65)
(6,35)-(6,41)
(6,35)-(6,70)
(6,60)-(6,70)
(6,61)-(6,69)
*)
