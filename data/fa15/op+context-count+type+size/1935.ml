
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem seen h) then seen @ [h] else seen in
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
(7,23)-(7,26)
(7,23)-(7,44)
(7,37)-(7,41)
(7,50)-(7,60)
*)

(* type error slice
(7,27)-(7,44)
(7,28)-(7,36)
(7,37)-(7,41)
(7,42)-(7,43)
(7,50)-(7,54)
(7,50)-(7,60)
(7,55)-(7,56)
(7,57)-(7,60)
(7,57)-(7,60)
(7,58)-(7,59)
*)
