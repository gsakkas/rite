
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec rev element =
    function | [] -> element | h::t -> rev (h :: element) t in
  rev [] l;;

let palindrome w =
  let reverse = listReverse (explode w) in
  if reverse = w then true else false;;
