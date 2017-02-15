
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,62)
(7,54)-(7,58)
(8,8)-(8,46)
*)

(* type error slice
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,34)
(7,35)-(7,39)
(7,54)-(7,58)
(7,54)-(7,62)
(7,59)-(7,60)
(7,61)-(7,62)
*)
