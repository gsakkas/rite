
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (!List.mem) (h, seen) then seen @ [h] in
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
(7,21)-(7,61)
(7,25)-(7,26)
(7,25)-(7,34)
(7,25)-(7,44)
(7,26)-(7,34)
(7,37)-(7,44)
(7,51)-(7,61)
*)

(* type error slice
(7,21)-(7,61)
(7,25)-(7,26)
(7,25)-(7,34)
(7,26)-(7,34)
(7,51)-(7,55)
(7,51)-(7,61)
(7,56)-(7,57)
(7,58)-(7,61)
(7,59)-(7,60)
*)
