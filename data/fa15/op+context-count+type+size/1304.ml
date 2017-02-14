
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, t) then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,38)
(7,34)-(7,38)
(7,37)-(7,38)
(7,53)-(7,56)
(8,9)-(8,46)
*)

(* type error slice
(7,21)-(7,56)
(7,24)-(7,32)
(7,24)-(7,38)
*)
