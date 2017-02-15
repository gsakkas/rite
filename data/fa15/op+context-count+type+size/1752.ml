
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,8)-(8,46)
(7,20)-(7,63)
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,36)
(7,37)-(7,38)
(7,59)-(7,63)
(8,8)-(8,46)
(9,12)-(9,18)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,36)
(7,37)-(7,38)
(7,44)-(7,45)
(7,44)-(7,53)
(7,44)-(7,53)
(7,49)-(7,53)
*)
