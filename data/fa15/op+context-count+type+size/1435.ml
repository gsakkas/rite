
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.rev (List.mem h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,31)
(7,23)-(7,46)
(9,2)-(9,8)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,46)
(7,32)-(7,46)
(7,33)-(7,41)
*)
