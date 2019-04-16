
let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper List.rev (0 :: l) in ans;;


(* fix

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (List.rev (0 :: l)) in ans;;

*)

(* changed spans
(9,17)-(9,44)
mulHelper (List.rev (0 :: l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(7,9)-(8,77)
(7,28)-(7,37)
(7,28)-(7,39)
(9,17)-(9,26)
(9,17)-(9,44)
*)
