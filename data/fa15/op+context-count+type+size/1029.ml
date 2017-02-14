
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
(3,2)-(3,56)
(3,8)-(3,9)
(3,23)-(3,25)
(3,43)-(3,47)
(3,43)-(3,56)
(3,51)-(3,56)
*)

(* type error slice
(3,2)-(3,56)
(3,2)-(3,56)
(3,43)-(3,47)
(3,43)-(3,56)
(3,43)-(3,56)
(3,51)-(3,56)
*)
