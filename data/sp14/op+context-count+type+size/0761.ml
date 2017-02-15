
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,37)
(7,32)-(7,37)
*)

(* type error slice
(4,4)-(8,46)
(4,4)-(8,46)
(7,20)-(7,62)
(7,23)-(7,31)
(7,23)-(7,37)
(7,32)-(7,37)
(7,33)-(7,34)
(7,35)-(7,36)
*)
