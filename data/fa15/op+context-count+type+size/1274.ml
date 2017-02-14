
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem (h, seen)) = true then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
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
(7,23)-(7,43)
(7,23)-(7,50)
(7,33)-(7,42)
(7,46)-(7,50)
*)

(* type error slice
(7,23)-(7,43)
(7,23)-(7,50)
(7,23)-(7,50)
(7,24)-(7,32)
(7,46)-(7,50)
*)
