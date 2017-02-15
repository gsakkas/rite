
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
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,38)
(7,33)-(7,34)
(7,36)-(7,37)
(7,44)-(7,53)
*)

(* type error slice
(7,20)-(7,63)
(7,23)-(7,31)
(7,23)-(7,38)
*)
