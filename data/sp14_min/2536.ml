
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl hd) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem hd seen) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,34)-(7,36)
hd
VarG

(7,37)-(7,39)
seen
VarG

*)

(* type error slice
(4,5)-(8,48)
(7,24)-(7,40)
(7,25)-(7,33)
(7,34)-(7,36)
(7,37)-(7,39)
*)
