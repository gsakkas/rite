
let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

let stringOfList f l = f (pipe List.map l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" (List.map f l);;

*)

(* changed spans
(2,9)-(3,69)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(3,2)-(3,69)
sl
VarG

(3,2)-(3,69)
fun sl ->
  match sl with
  | [] -> ""
  | h :: t -> (let f =
                 fun a ->
                   fun x -> a ^ (sep ^ x) in
               let base = h in
               let l = t in
               List.fold_left f base l)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,2)-(3,69)
""
LitG

(3,2)-(3,69)
match sl with
| [] -> ""
| h :: t -> (let f =
               fun a ->
                 fun x -> a ^ (sep ^ x) in
             let base = h in
             let l = t in
             List.fold_left f base l)
CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(3,18)-(3,23)
a ^ (sep ^ x)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(3,19)-(3,20)
(^)
VarG

(3,36)-(3,41)
sep ^ x
AppG (fromList [VarG])

(3,40)-(3,41)
sep
VarG

(3,40)-(3,41)
(^)
VarG

(3,45)-(3,69)
h
VarG

(3,45)-(3,69)
t
VarG

(3,45)-(3,69)
let base = h in
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,45)-(3,69)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(3,67)-(3,69)
l
VarG

(5,26)-(5,30)
sepConcat
VarG

(5,31)-(5,39)
List.map f l
AppG (fromList [VarG])

(5,31)-(5,39)
""
LitG

(5,40)-(5,41)
f
VarG

*)
