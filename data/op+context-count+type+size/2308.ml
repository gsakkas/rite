
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] in
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
(7,21)-(7,65)
*)

(* type error slice
(7,21)-(7,65)
(7,25)-(7,33)
(7,25)-(7,40)
(7,25)-(7,49)
(7,34)-(7,35)
(7,36)-(7,40)
(7,44)-(7,49)
(7,55)-(7,59)
(7,55)-(7,65)
(7,60)-(7,61)
(7,62)-(7,65)
(7,63)-(7,64)
*)
