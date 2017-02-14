
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h @ [] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,47)
(7,34)-(7,35)
(7,41)-(7,42)
(7,41)-(7,47)
(7,43)-(7,44)
(7,45)-(7,47)
(8,8)-(8,46)
*)

(* type error slice
(7,20)-(7,47)
(7,20)-(7,47)
(7,20)-(7,47)
(7,41)-(7,47)
(7,43)-(7,44)
*)
