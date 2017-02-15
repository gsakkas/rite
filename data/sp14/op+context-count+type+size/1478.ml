
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
(9,16)-(9,45)
(9,27)-(9,28)
*)

(* type error slice
(4,4)-(8,76)
(4,4)-(8,76)
(7,27)-(7,36)
(7,27)-(7,38)
(7,37)-(7,38)
(9,2)-(9,52)
(9,16)-(9,29)
(9,16)-(9,45)
(9,17)-(9,26)
(9,27)-(9,28)
*)
