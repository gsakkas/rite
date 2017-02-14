
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem h seen then rest else h :: rest in
        helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,21)
(8,8)-(9,29)
(8,44)-(8,48)
(8,59)-(8,63)
(9,8)-(9,29)
*)

(* type error slice
(3,2)-(10,27)
(3,18)-(9,29)
(7,8)-(9,29)
(7,20)-(7,21)
(8,23)-(8,31)
(8,23)-(8,38)
(8,32)-(8,33)
(8,34)-(8,38)
(9,8)-(9,14)
(9,8)-(9,29)
(9,15)-(9,29)
(9,16)-(9,21)
*)
