
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (!List.mem) h seen then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,56)
(7,23)-(7,34)
(7,24)-(7,25)
(8,8)-(8,46)
*)

(* type error slice
(7,20)-(7,56)
(7,20)-(7,56)
(7,20)-(7,56)
(7,23)-(7,34)
(7,24)-(7,25)
(7,25)-(7,33)
(7,47)-(7,56)
*)
