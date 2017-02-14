
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        if (List.mem h List.rev t) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,9)-(9,76)
(7,21)-(7,22)
(7,21)-(7,30)
(7,26)-(7,30)
(8,9)-(9,76)
(8,13)-(8,21)
(8,13)-(8,34)
(8,13)-(8,43)
(8,22)-(8,23)
(8,24)-(8,32)
(8,38)-(8,43)
(9,14)-(9,76)
(9,39)-(9,76)
*)

(* type error slice
(8,13)-(8,21)
(8,13)-(8,34)
*)
