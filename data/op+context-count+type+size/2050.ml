
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
(7,21)-(7,48)
(7,35)-(7,36)
(7,42)-(7,43)
(7,42)-(7,48)
(7,44)-(7,45)
(7,46)-(7,48)
(8,9)-(8,46)
*)

(* type error slice
(7,21)-(7,48)
(7,21)-(7,48)
(7,21)-(7,48)
(7,42)-(7,48)
(7,44)-(7,45)
*)
