
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem seen h) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,33)-(7,37)
(7,43)-(7,48)
*)

(* type error slice
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,37)
(7,38)-(7,39)
(7,54)-(7,58)
(7,54)-(7,64)
(7,59)-(7,60)
(7,61)-(7,64)
(7,61)-(7,64)
(7,62)-(7,63)
*)
