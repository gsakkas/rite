
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl [2]) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem hd seen) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,33)-(7,35)
(7,36)-(7,39)
(7,37)-(7,38)
(7,43)-(7,47)
*)

(* type error slice
(4,4)-(8,47)
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,35)
(7,36)-(7,39)
(7,37)-(7,38)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,47)
(4,4)-(8,47)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,47)
(7,20)-(7,73)
(7,23)-(7,47)
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,35)
(7,36)-(7,39)
(7,37)-(7,38)
(7,43)-(7,47)
(7,53)-(7,57)
(7,63)-(7,73)
(7,63)-(7,65)
(7,69)-(7,73)
(8,8)-(8,47)
(8,20)-(8,22)
(8,26)-(8,47)
(8,26)-(8,32)
(8,33)-(8,47)
(8,34)-(8,39)
(8,41)-(8,46)
(9,2)-(9,27)
(9,2)-(9,10)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
(9,24)-(9,25)
*)
