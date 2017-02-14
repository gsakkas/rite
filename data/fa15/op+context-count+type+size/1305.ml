
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h seen) then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,40)
(7,34)-(7,40)
*)

(* type error slice
(7,21)-(7,64)
(7,24)-(7,32)
(7,24)-(7,40)
(7,34)-(7,35)
(7,34)-(7,40)
(7,36)-(7,40)
(7,55)-(7,56)
(7,55)-(7,64)
(7,55)-(7,64)
(7,60)-(7,64)
*)
