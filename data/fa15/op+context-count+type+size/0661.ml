
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h else t in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,34)-(7,35)
(7,41)-(7,42)
(7,48)-(7,49)
*)

(* type error slice
(4,4)-(8,46)
(4,4)-(8,46)
(7,20)-(7,49)
(7,20)-(7,49)
(7,41)-(7,42)
(7,48)-(7,49)
*)
