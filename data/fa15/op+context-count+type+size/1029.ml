
let rec listReverse l =
  match l with | [] -> [] | front::back -> back :: front;;


(* fix

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

*)

(* changed spans
(3,3)-(3,57)
(3,9)-(3,10)
(3,24)-(3,26)
(3,44)-(3,48)
(3,44)-(3,57)
(3,52)-(3,57)
*)

(* type error slice
(3,3)-(3,57)
(3,3)-(3,57)
(3,44)-(3,48)
(3,44)-(3,57)
(3,44)-(3,57)
(3,52)-(3,57)
*)
