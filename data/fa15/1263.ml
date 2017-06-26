
let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> []
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;


(* fix

let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> ""
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;

*)

(* changed spans
(5,10)-(5,12)
*)

(* type error slice
(4,2)-(9,19)
(5,10)-(5,12)
(7,6)-(9,19)
(8,44)-(8,62)
(8,46)-(8,47)
(8,48)-(8,62)
(8,49)-(8,59)
(9,6)-(9,16)
(9,6)-(9,19)
*)

(* all spans
(2,17)-(9,19)
(2,19)-(9,19)
(3,2)-(9,19)
(3,11)-(3,23)
(3,11)-(3,19)
(3,20)-(3,21)
(3,22)-(3,23)
(4,2)-(9,19)
(4,8)-(4,10)
(5,10)-(5,12)
(7,6)-(9,19)
(7,25)-(8,62)
(8,8)-(8,62)
(8,14)-(8,17)
(8,31)-(8,33)
(8,44)-(8,62)
(8,46)-(8,47)
(8,44)-(8,45)
(8,48)-(8,62)
(8,49)-(8,59)
(8,60)-(8,61)
(9,6)-(9,19)
(9,6)-(9,16)
(9,17)-(9,19)
*)
