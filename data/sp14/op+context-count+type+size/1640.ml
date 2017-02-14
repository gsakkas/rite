
let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = (mulHelper 0) :: (List.rev l) in ans;;


(* fix

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (0 :: (List.rev l)) in ans;;

*)

(* changed spans
(9,18)-(9,45)
(9,28)-(9,29)
*)

(* type error slice
(4,5)-(8,75)
(4,5)-(8,75)
(7,28)-(7,37)
(7,28)-(7,39)
(7,38)-(7,39)
(9,3)-(9,53)
(9,18)-(9,27)
(9,18)-(9,29)
(9,18)-(9,45)
(9,28)-(9,29)
*)
