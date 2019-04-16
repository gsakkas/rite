
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> [helper t1; h1 mod 10] in
           helper [h]);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> (helper t1) @ [h1 mod 10] in
           helper [h]);;

*)

(* changed spans
(12,52)-(12,74)
helper t1 @ [h1 mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(6,7)-(13,23)
(9,16)-(9,18)
(11,12)-(13,22)
(11,27)-(12,74)
(12,14)-(12,74)
(12,52)-(12,74)
(12,53)-(12,59)
(12,53)-(12,62)
(12,64)-(12,73)
(13,12)-(13,18)
(13,12)-(13,22)
*)
