
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in let rest' = List.mem h l in helper (seen', rest') in
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
(7,21)-(7,22)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG))

(7,38)-(7,50)
t
VarG

*)

(* type error slice
(3,3)-(8,28)
(3,19)-(7,75)
(4,5)-(7,75)
(4,11)-(4,15)
(7,26)-(7,75)
(7,38)-(7,46)
(7,38)-(7,50)
(7,49)-(7,50)
(7,54)-(7,60)
(7,54)-(7,75)
(7,61)-(7,75)
(7,69)-(7,74)
(8,12)-(8,28)
(8,13)-(8,19)
(8,20)-(8,27)
(8,25)-(8,26)
*)
