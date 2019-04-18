
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [2] in
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
(7,45)-(7,48)
h :: seen
AppG (fromList [VarG])

(7,48)-(7,48)
h :: seen
AppG (fromList [VarG])

*)

(* type error slice
(7,21)-(7,48)
(7,45)-(7,48)
(7,48)-(7,48)
*)
