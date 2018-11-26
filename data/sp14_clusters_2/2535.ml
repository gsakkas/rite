
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
(4,4)-(6,77)
match rest with
| [] -> seen
| hd :: tl -> (let seen' =
                 hd :: seen in
               let rest' = tl in
               helper (seen' , rest'))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(6,26)-(6,30)
hd
VarG

(6,51)-(6,52)
tl
VarG

*)
