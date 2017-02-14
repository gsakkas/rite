
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
(7,25)-(7,42)
(7,25)-(7,51)
(7,35)-(7,42)
(7,47)-(7,51)
*)

(* type error slice
(7,25)-(7,33)
(7,25)-(7,42)
(7,25)-(7,51)
(7,25)-(7,51)
(7,47)-(7,51)
*)
