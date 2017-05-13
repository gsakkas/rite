
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec palindrome w =
  match w with
  | [] -> (match listReverse w with | [] -> true | _ -> false)
  | h::t ->
      (match listReverse w with
       | [] -> true
       | h2::t2 -> if h2 = h then palindrome t else false);;

let _ = palindrome "malayalam";;
