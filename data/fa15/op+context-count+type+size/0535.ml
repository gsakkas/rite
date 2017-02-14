
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, l) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if 3 > 0 then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,32)
(7,24)-(7,38)
(7,34)-(7,35)
(7,34)-(7,38)
(7,37)-(7,38)
(7,45)-(7,54)
*)

(* type error slice
(7,21)-(7,64)
(7,24)-(7,32)
(7,24)-(7,38)
*)
