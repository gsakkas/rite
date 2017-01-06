
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat ^ (";" ^ ((List.map f l) ^ "]")));;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;


(* changed spans
(9,31)-(9,42)
(9,48)-(9,49)
(9,51)-(9,52)
(9,72)-(9,74)
*)

(* type error slice
(7,36)-(7,59)
*)
