
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
