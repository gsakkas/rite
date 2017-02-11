
let rec reverseHelper l result =
  match l with | x::s -> reverseHelper s (x :: result) | [] -> result;;

let rec listReverse l = reverseHelper l [];;

let rec palindromeHelper w r =
  match w with
  | [] -> (match r with | [] -> true | _ -> false)
  | x::s ->
      (match r with
       | y::t -> if x = y then palindromeHelper s t else false
       | _ -> false);;

let palindrome w = let r = listReverse w in palindromeHelper w r;;

let _ = palindrome "malayalam";;
