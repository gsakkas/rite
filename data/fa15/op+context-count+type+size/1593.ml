
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.rev (List.mem h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


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
(7,24)-(7,32)
(7,24)-(7,46)
(9,3)-(9,9)
*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,46)
(7,34)-(7,42)
(7,34)-(7,46)
*)
