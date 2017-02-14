
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
(7,20)-(7,60)
(7,23)-(7,34)
(7,23)-(7,44)
(7,24)-(7,25)
(7,25)-(7,33)
(7,35)-(7,44)
(7,50)-(7,60)
*)

(* type error slice
(7,20)-(7,60)
(7,20)-(7,60)
(7,20)-(7,60)
(7,23)-(7,34)
(7,24)-(7,25)
(7,25)-(7,33)
(7,50)-(7,60)
(7,55)-(7,56)
*)
