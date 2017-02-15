
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else seen :: h in
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
(7,51)-(7,55)
(8,8)-(8,46)
(9,2)-(9,8)
*)

(* type error slice
(7,20)-(7,60)
(7,20)-(7,60)
(7,41)-(7,45)
(7,51)-(7,55)
(7,51)-(7,60)
(7,51)-(7,60)
*)
