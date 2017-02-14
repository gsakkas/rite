
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
(7,8)-(9,76)
(7,20)-(7,21)
(7,20)-(7,29)
(7,25)-(7,29)
(8,8)-(9,76)
(8,11)-(8,34)
(8,11)-(8,42)
(8,12)-(8,20)
(8,21)-(8,22)
(8,23)-(8,31)
(8,37)-(8,42)
(9,13)-(9,76)
(9,38)-(9,76)
*)

(* type error slice
(8,11)-(8,34)
(8,12)-(8,20)
*)
