
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h t) then seen :: h else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,39)-(7,40)
(7,47)-(7,56)
(7,55)-(7,56)
(8,8)-(8,46)
*)

(* type error slice
(7,20)-(7,66)
(7,20)-(7,66)
(7,47)-(7,51)
(7,47)-(7,56)
(7,47)-(7,56)
(7,62)-(7,66)
*)
