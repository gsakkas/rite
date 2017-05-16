
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
(9,16)-(9,43)
(9,26)-(9,34)
*)

(* type error slice
(7,8)-(8,76)
(7,27)-(7,36)
(7,27)-(7,38)
(9,16)-(9,25)
(9,16)-(9,43)
*)

(* all spans
(2,19)-(9,50)
(2,21)-(9,50)
(3,2)-(9,50)
(3,20)-(8,76)
(4,4)-(8,76)
(4,10)-(4,12)
(5,12)-(5,19)
(5,13)-(5,14)
(5,16)-(5,18)
(7,8)-(8,76)
(7,27)-(7,38)
(7,27)-(7,36)
(7,37)-(7,38)
(8,8)-(8,76)
(8,19)-(8,34)
(8,19)-(8,26)
(8,20)-(8,21)
(8,24)-(8,25)
(8,29)-(8,34)
(8,38)-(8,76)
(8,39)-(8,50)
(8,40)-(8,44)
(8,47)-(8,49)
(8,52)-(8,75)
(8,53)-(8,66)
(8,54)-(8,58)
(8,63)-(8,65)
(8,70)-(8,74)
(9,2)-(9,50)
(9,16)-(9,43)
(9,16)-(9,25)
(9,26)-(9,34)
(9,35)-(9,43)
(9,36)-(9,37)
(9,41)-(9,42)
(9,47)-(9,50)
*)
