
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
(7,24)-(7,37)
(7,34)-(7,37)
*)

(* type error slice
(4,5)-(8,46)
(7,21)-(7,63)
(7,24)-(7,32)
(7,24)-(7,37)
(7,34)-(7,35)
(7,34)-(7,37)
(7,36)-(7,37)
*)
