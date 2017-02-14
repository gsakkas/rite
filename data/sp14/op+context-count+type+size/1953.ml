
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen in
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
(7,20)-(7,48)
(7,44)-(7,48)
*)

(* type error slice
(7,20)-(7,48)
(7,20)-(7,48)
(7,20)-(7,48)
(7,23)-(7,31)
(7,23)-(7,38)
(7,34)-(7,38)
(7,44)-(7,48)
*)
