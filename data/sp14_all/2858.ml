
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [h] in let rest' = List.mem h l in helper (seen', rest') in
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
(7,21)-(7,24)
if List.mem h seen
then seen
else h :: seen
IteG (AppG [EmptyG,EmptyG]) VarG (AppG [EmptyG,EmptyG])

(7,40)-(7,52)
t
VarG

*)

(* type error slice
(3,3)-(8,28)
(3,19)-(7,77)
(4,5)-(7,77)
(4,11)-(4,15)
(7,28)-(7,77)
(7,40)-(7,48)
(7,40)-(7,52)
(7,51)-(7,52)
(7,56)-(7,62)
(7,56)-(7,77)
(7,63)-(7,77)
(7,71)-(7,76)
(8,12)-(8,28)
(8,13)-(8,19)
(8,20)-(8,27)
(8,25)-(8,26)
*)
