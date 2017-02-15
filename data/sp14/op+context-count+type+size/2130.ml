
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  helper ([], l);;

*)

(* changed spans
(7,8)-(8,76)
(7,11)-(7,19)
(7,11)-(7,26)
(7,20)-(7,21)
(7,22)-(7,26)
(8,13)-(8,76)
(8,38)-(8,76)
(9,2)-(9,10)
*)

(* type error slice
(4,4)-(8,76)
(4,4)-(8,76)
(5,12)-(5,16)
(7,8)-(8,76)
(7,8)-(8,76)
(7,8)-(8,76)
(7,11)-(7,19)
(7,11)-(7,26)
(7,22)-(7,26)
(8,13)-(8,76)
(8,38)-(8,76)
(8,55)-(8,61)
(8,55)-(8,76)
(9,2)-(9,10)
(9,2)-(9,27)
(9,11)-(9,27)
(9,12)-(9,18)
*)
