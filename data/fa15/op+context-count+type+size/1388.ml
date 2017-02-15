
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [seen] else [seen @ h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,44)-(7,50)
(7,56)-(7,66)
(7,64)-(7,65)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,33)
(7,34)-(7,38)
(7,57)-(7,61)
(7,57)-(7,65)
(7,62)-(7,63)
(7,64)-(7,65)
*)
