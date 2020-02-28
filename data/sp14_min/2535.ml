
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen :: h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = hd :: seen in let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(4,5)-(6,78)
match rest with
| [] -> seen
| hd :: tl -> (let seen' =
                 hd :: seen in
               let rest' = tl in
               helper (seen' , rest'))
CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConsPatG EmptyPatG EmptyPatG,Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]

(6,27)-(6,31)
hd
VarG

(6,35)-(6,36)
seen
VarG

(6,52)-(6,53)
tl
VarG

*)

(* type error slice
(3,3)-(7,28)
(3,19)-(6,78)
(6,15)-(6,78)
(6,27)-(6,31)
(6,27)-(6,36)
(6,57)-(6,63)
(6,57)-(6,78)
(6,64)-(6,78)
(6,65)-(6,70)
*)
