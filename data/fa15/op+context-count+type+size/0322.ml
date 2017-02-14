
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [seen; h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,53)
(7,44)-(7,53)
(7,45)-(7,49)
(7,51)-(7,52)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,33)
(7,34)-(7,38)
(7,44)-(7,53)
(7,44)-(7,53)
(7,45)-(7,49)
(7,51)-(7,52)
*)
