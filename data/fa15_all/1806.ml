
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else (let seen' = h :: seen' in helper (seen', rest')) in
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
(11,31)-(11,36)
seen
VarG

(11,40)-(11,61)
t
VarG

(11,40)-(11,61)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
