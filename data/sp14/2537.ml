
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl [hd]) = true then seen else hd :: seen in
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
(7,36)-(7,40)
(7,44)-(7,48)
*)

(* type error slice
(4,4)-(8,47)
(7,23)-(7,41)
(7,24)-(7,32)
(7,33)-(7,35)
(7,36)-(7,40)
(7,37)-(7,39)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,47)
(4,4)-(8,47)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,47)
(7,20)-(7,74)
(7,23)-(7,48)
(7,23)-(7,41)
(7,24)-(7,32)
(7,33)-(7,35)
(7,36)-(7,40)
(7,37)-(7,39)
(7,44)-(7,48)
(7,54)-(7,58)
(7,64)-(7,74)
(7,64)-(7,66)
(7,70)-(7,74)
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
