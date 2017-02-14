
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem (h, l)) then h :: seen else seen in
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
(7,24)-(7,27)
(7,24)-(7,43)
(7,29)-(7,37)
(7,29)-(7,43)
(7,39)-(7,40)
(7,39)-(7,43)
(7,42)-(7,43)
(7,51)-(7,60)
*)

(* type error slice
(7,24)-(7,27)
(7,24)-(7,43)
(7,29)-(7,37)
(7,29)-(7,43)
*)
